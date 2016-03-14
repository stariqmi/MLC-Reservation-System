// npm modules
var $ = require('jquery');
var Handlebars = require('handlebars');
var jqUI = require('jquery-ui');
var moment = require('moment');
var page = require('page');
var clone = require('clone');

// forms json
var per_person_json = require('./per_person.json');
var total_price_json = require('./total_price.json');
var hourly_rate_json = require('./hourly_rate.json');
var cc_form_json = require('./cc_payment_form.json');
var status_json = require('./status.json');

// Local modules
var afterRender = require('./afterRender');
var displayAfterRender = require('./displayAfterRender');
var submit = require('./submit');
var drawCalendar = require('./clndr.js');

var contentContainerClass = ".contentContainer";
var $contentContainer = $(contentContainerClass);

module.exports = {
	renderForm: function(formType, DEBUG) {
		
		var source = $('#form-template').html();
		var template = Handlebars.compile(source);
		
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
		$contentContainer.append(template(formSpec));
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
		
		// On submit form click
		// Validate required fields
		$('#btn-submit').on('click', submit.reservationWithCC(formSpec));
		
		// Make sure loading div is hidden initially
		// Hide it after everything is rendered
		$('#loading').hide();
	},
		
	renderCalendar: function() {
		
		var month = moment().month() + 1;
		
		$.ajax('/reservations/' + month + '/' + month, {
			method: 'GET',
			success: function(data, status) {
				drawCalendar(data);
			}
		});
	},
	
	renderReservation: function(reservationID, ADMIN) {
		
		$('#loading').show();
		$.ajax('/reservations/' + reservationID, {
			method: 'GET',
			success: function(data, status) {
				$('#loading').hide();
				
				// Get the spec to render
				var spec;
				switch (data.form_type) {
					case 'per_person':
						spec = per_person_json
						break;
					case 'total_price':
						spec = total_price_json
						break;
					case 'hourly_rate':
						spec = hourly_rate_json
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
					console.log(data);
					spec.transaction = data.transaction || {};
				}
				
				for (var si in spec.sections) {
					for (var fi in spec.sections[si].fields) {
						var field = spec.sections[si].fields[fi];
						
						// Data is saved in DB with spec ids
						spec.sections[si].fields[fi].value = data[field.id];
					}
				}
				
				var source = $('#reservation-display-template').html();
				var template = Handlebars.compile(source);
				$contentContainer.append(template(spec));
				
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
				
				$('.delete-btn').on('click', function() {
					$('#loading').show();
					$.ajax('/reservations/' + reservationID, {
						method: 'DELETE',
						success: function(data, status) {
							$('#loading').hide();
							if (data.status === 'ok') page('/admin/calendar2');
							else alert('Can not delete, please contact your developer');
						}
					});
				});
			}
		});
	}
}