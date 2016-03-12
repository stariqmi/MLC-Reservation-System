// npm modules
var $ = require('jquery');
var Handlebars = require('handlebars');
var jqUI = require('jquery-ui');
var moment = require('moment');
var Fullcalendar = require('fullcalendar');
var page = require('page');

// forms json
var per_person_json = require('./per_person.json');
var cc_form_json = require('./cc_payment_form.json');
var status_json = require('./status.json');
var afterRender = require('./afterRender');
var displayAfterRender = require('./displayAfterRender');
var submit = require('./submit');
var calendarOptions = require('./calendarOptions');

var contentContainerClass = ".contentContainer";
var $contentContainer = $(contentContainerClass);

module.exports = {
	renderForm: function(formType, DEBUG) {
		
		var source = $('#sections-template').html();
		var template = Handlebars.compile(source);
		
		var formSpec;
		
		switch (formType) {
			case 'pp':
				formSpec = per_person_json;
				break;
			default:
				formSpec = per_person_json;
		}
		
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
		
		// Add Credit card payment
		var ccSource = $('#payment-template').html();
		var ccTemplate = Handlebars.compile(ccSource);
		
		$contentContainer.append(ccTemplate({fields: cc_form_json.fields}));
		$('.error-info').hide();
		
		var submitSource = $("#reservation-submit-template").html();
		var submitTemplate = Handlebars.compile(submitSource);
		$contentContainer.append(submitTemplate());
		
		// On submit form click
		// Validate required fields
		$('#btn-submit').on('click', submit.reservationWithCC(formSpec));
		
		// Make sure loading div is hidden initially
		// Hide it after everything is rendered
		$('#loading').hide();
	},
	
	renderCalendar: function() {
		
		/*
			Authenticate via cookie
			If authentication fails, render empty template
			Else render calender
		*/
		var source = $('#calendar-template').html();
		var template = Handlebars.compile(source);
		
		$contentContainer.html(template(status_json));
		$('#calendar').fullCalendar(calendarOptions);
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
					default:
						spec = per_person_json;
				}
				
				// This enable the delete button
				spec.admin = ADMIN;
				
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
							if (data.status === 'ok') page('/admin/calendar');
							else alert('Can not delete, please contact your developer');
						}
					});
				});
			}
		});
	}
}