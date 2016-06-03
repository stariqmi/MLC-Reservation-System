// npm modules
var $ = require('jquery');
var jqUI = require('jquery-ui');
var moment = require('moment');
var page = require('page');
var clone = require('clone');
var Promise = require('bluebird');

// forms json
var per_person_json = require('./form_specs/per_person.json');
var total_price_json = require('./form_specs/total_price.json');
var hourly_rate_json = require('./form_specs/hourly_rate.json');
var cc_form_json = require('./form_specs/cc_payment_form.json');
var status_json = require('./status.json');

// Local modules and utils
var afterRender = require('./afterRender');
var displayAfterRender = require('./displayAfterRender');
var submit = require('./submit');
var drawCalendar = require('./clndr.js');
var loadingUtils = require('./utils/loading.js');
var templateUtils = require('./utils/templates.js');
var ajaxUtils = require('./utils/ajax.js');
var eventUtils = require('./utils/events.js');

var contentContainerClass = ".contentContainer";
var $contentContainer = $(contentContainerClass);

module.exports = {
	/*
		Renders reservation + payment form based on spec specified via URL
	 */
	renderForm: function(formType, DEBUG) {
		
		var formSpec;
		
		// Need to clone it so that the source spec doesnt get polluted
		switch (formType) {
			case 'pp':
				formSpec = clone(per_person_json);
				break;
			case 'tp':
				formSpec = clone(total_price_json);
				break
			case 'hr':
				formSpec = clone(hourly_rate_json);
				break;
			default:
				// formSpec = clone(per_person_json);
				page('/404');
				break
		}
		
		// Add the Credit Card form spec
		formSpec.ccSpec = clone(cc_form_json);
		
		// Add form page
		templateUtils.render({
			name: 'form', 
			data: formSpec
		});
		
		$('.error-info').hide();
		
		// Modify fields - datetime conversion and register event handlers
		for (var si in formSpec.sections) {
			for (var fi in formSpec.sections[si].fields) {
				var field = formSpec.sections[si].fields[fi];			
				var $field = $('#' + field.id);

				// If debugging
				if (DEBUG && field.debugVal && field.required) {
					console.log(field.debugVal);
					$field.val(field.debugVal);
				}
				
				// Custom modification of fields
				if (field.afterRender) {		
					afterRender[field.afterRender]($field);
				}
			}
		}
		
		$('.error-info').hide();
		$('#error-indication').hide();
		
		// On submit form click
		// Validate required fields
		$('#btn-submit').on('click', submit.reservationWithCC(formSpec));
		
		// Make sure loading div is hidden initially
		// Hide it after everything is rendered
		loadingUtils.hide();
	},
		
	/*
		Renders calendar
	 */
	renderCalendar: function() {
		
		var month = moment().month() + 1;
		
		ajaxUtils.makeRequest('GET', '/reservations/' + month + '/' + month)
		.then(function(data) {
			drawCalendar(data);
		});
	},
	
	renderReservationsByDate: function(year, month, day) {
		loadingUtils.show();
		$.ajax('/reservations_by_date/' + year + '/' + month + '/' + day, {
			method: 'GET',
			success: function(data, status) {
				loadingUtils.hide();
				var template = templateUtils.fetch('reservation_by_date_display');
				
				var reservations = [];
				for (var d in data) {
					var reservation = data[d];
					// Get the spec to render
					var spec;
					switch (reservation.form_type) {
						case 'per_person':
							spec = clone(per_person_json);
							break;
						case 'total_price':
							spec = clone(total_price_json);
							break;
						case 'hourly_rate':
							spec = clone(hourly_rate_json);
							break;
						default:
							throw new Error(
								'Undefined form_type for reservation. Cannot determine how to display',
								'render.js',
								120
							)
					}
					
					if (spec.admin) {
						spec.transaction = reservation.transaction || {};
					}
					
					for (var si in spec.sections) {
						for (var fi in spec.sections[si].fields) {
							var field = spec.sections[si].fields[fi];
							
							// Data is saved in DB with spec ids
							spec.sections[si].fields[fi].value = reservation[field.id];
						}
					}
					reservations.push({reservation: spec});
				}
				
				$contentContainer.append(template({admin: true, reservations: reservations, date: month + '-' + day + '-' + year}));
			}
		});
	},
	
	renderReservation: function(reservationID, ADMIN) {
		
		loadingUtils.show('Loading reservation ...');
		
		$.ajax('/reservations/' + reservationID, {
			method: 'GET',
			success: function(data, status) {
				loadingUtils.hide();
				
				// Get the spec to render
				var spec;
				switch (data.form_type) {
					case 'per_person':
						spec = clone(per_person_json)
						break;
					case 'total_price':
						spec = clone(total_price_json)
						break;
					case 'hourly_rate':
						spec = clone(hourly_rate_json)
						break;
					default:
						throw new Error(
							'Undefined form_type for reservation. Cannot determine how to display',
							'render.js',
							120
						)
				}
				
				// This enable the delete button
				spec.admin = ADMIN;
				
				if (spec.admin) {
					spec.transaction = data.transaction || {};
				}
				
				for (var si in spec.sections) {
					for (var fi in spec.sections[si].fields) {
						var field = spec.sections[si].fields[fi];
						
						// Data is saved in DB with spec ids
						spec.sections[si].fields[fi].value = data[field.id];
					}
				}
				
				// Add employees
				$.ajax('/employees', {
					method: 'GET',
					success: function(data, status) {
					
						spec.employees = data;
						
						templateUtils.render({
							name: 'reservation_display',
							data: spec
						});
						
						// After Render
						for (var si in spec.sections) {
							for (var fi in spec.sections[si].fields) {
								var field = spec.sections[si].fields[fi];
								
								$field = $('span#' + field.id);
								if (field.displayAfterRender) {
									displayAfterRender[field.displayAfterRender]($field, field.value);
								}
							}
						}
						
						$('.notify-btn').on('click', function(e) {
							e.preventDefault();
							loadingUtils.show('Sending email ...');
							var emailPromise = new Promise(function(resolve, reject) {
								var data = $('.email-form select').val().split('/');
								var email = data[0];
								var number = data[1];
								$.ajax('/employees/email_reservation?reservation_id=' + reservationID + '&to=' + email,  {
									method: 'POST',
									success: function(data, status) {
										resolve(number);
									}
								})
							})
								.then(function(number) {
									loadingUtils.show('Sending SMS ...');
									return new Promise(function(resolve, reject) {
										$.ajax('/employees/sms_reservation?reservation_id=' + reservationID + '&to=' + number, {
											method: 'POST',
											success: function(data, status) {
												if (data.error) reject();
												resolve(data);
											}
										});
									});
								})
								.then(function(data) {
									loadingUtils.hide();
								})
								.catch(function(err) {
									console.log(err);
								})
								
						});	
						
						$('.delete-btn').on('click', eventUtils.reservationDeleteBtnClick);
					}
				});
			}
		});
	}
}