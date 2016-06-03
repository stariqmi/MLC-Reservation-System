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
var specUtils = require('./utils/spec.js');

var contentContainerClass = ".contentContainer";
var $contentContainer = $(contentContainerClass);

module.exports = {
	/*
		Renders reservation + payment form based on spec specified via URL
	 */
	renderForm: function(formType, DEBUG) {
		
		var formSpec = specUtils.get(formType);
		if (!formSpec) page('/404');
		
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
	
	/*
		Render reservations on a specific date
	 */
	renderReservationsByDate: function(year, month, day) {
		loadingUtils.show();
		ajaxUtils.makeRequest('GET', '/reservations_by_date/' + year + '/' + month + '/' + day)
		.then(function(data) {
			loadingUtils.hide();
			var template = templateUtils.fetch('reservation_by_date_display');
			
			var reservations = [];
			for (var d in data) {
				var reservation = data[d];
				// Get the spec to render
				var spec = specUtils.get(reservation.form_type) 
				if (!spec) {
					throw new Error(
						'Undefined form_type for reservation. Cannot determine how to display',
						'render.js'
					);
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
			
			$contentContainer.append(template({
				admin: true, 
				reservations: reservations,
				 date: month + '-' + day + '-' + year
			 }));
		});
	},

	/*
		Render a specific reservation
	 */
	renderReservation: function(reservationID, ADMIN) {
		
		loadingUtils.show('Loading reservation ...');
		
		$.ajax('/reservations/' + reservationID, {
			method: 'GET',
			success: function(data, status) {
				loadingUtils.hide();
				
				// Get the spec to render
				var spec = specUtils.get(data.form_type);
				if (!spec) {
					throw new Error(
						'Undefined form_type for reservation. Cannot determine how to display',
						'render.js'
					);
				}
				
				// This enables delete, back and notify features
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
				
				// Fetch employees
				ajaxUtils.makeRequest('GET', '/employees')
				.then(function(data) {
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
					
					$('.notify-btn').on('click', eventUtils.employeeNotifyBtnClick(reservationID));	
					
					$('.delete-btn').on('click', eventUtils.reservationDeleteBtnClick);
				});
			}
		});
	}
}