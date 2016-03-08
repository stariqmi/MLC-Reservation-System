// npm modules
var $ = require('jquery');
var Handlebars = require('handlebars');
var jqUI = require('jquery-ui');
var moment = require('moment');
var Fullcalendar = require('fullcalendar');

// forms json
var per_person_json = require('./per_person.json');
var cc_form_json = require('./cc_payment_form.json');
var afterRender = require('./afterRender');
var submit = require('./submit');
var calendarOptions = require('./calendarOptions');

var contentContainerClass = ".contentContainer";
var $contentContainer = $(contentContainerClass);

module.exports = {
	renderForm: function(formType, DEBUG) {

		// Make sure loading div is hidden initially
		$('#loading').hide();
		
		var source = $('#sections-template').html();
		var template = Handlebars.compile(source);
		
		var formSpec;
		
		switch (formType) {
			case 'per_person':
				formSpec = per_person_json;
				break;
			default:
				formSpec = per_person_json;
		}
		
		// Add form page
		$contentContainer.append(template(formSpec));
		$('.error-info').hide();
		
		// Modify fields - datetime conversion and register event handlers
		for (var si in per_person_json.sections) {
			for (var fi in per_person_json.sections[si].fields) {
				var field = per_person_json.sections[si].fields[fi];			
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
		
		// On submit form click
		// Validate required fields
		$('#btn-submit').on('click', submit.reservation(formSpec));
	},
	
	renderCCPaymentForm: function(reservationID, DEBUG) {
		
		// Make sure loading div is visible initially
		$('#loading').show();
		
		$.ajax('/reservations/' + reservationID, {
			method: 'GET',
			success: function(data, status) {
				var source = $('#payment-template').html();
				var template = Handlebars.compile(source);
				
				$contentContainer.append(template({id: reservationID, fields: cc_form_json.fields}));
				$('.error-info').hide();
				
				for (var fi in cc_form_json.fields) {
					var field = cc_form_json.fields[fi];
					
					// Call afterRender on the field with the reservation data
					if (field.afterRender) afterRender[field.afterRender]($('#' + field.id), data);
				}
				
				// On submit
				$('#cc-submit-btn').on('click', submit.payment(reservationID, cc_form_json));
				$('#loading').hide();
			}
		})
	},
	
	renderCalendar: function() {
		
		/*
			Authenticate via cookie
			If authentication fails, render empty template
			Else render calender
		*/
		var source = $('#calendar-template').html();
		var template = Handlebars.compile(source);
		
		$contentContainer.html(template());
		$('#calendar').fullCalendar(calendarOptions);
	},
	
	renderReservation: function(reservationID) {
		
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
				
				for (var si in per_person_json.sections) {
					for (var fi in per_person_json.sections[si].fields) {
						var field = per_person_json.sections[si].fields[fi];
						
						// Data is saved in DB with spec ids
						per_person_json.sections[si].fields[fi].value = data[field.id];
					}
				}
				
				var source = $('#reservation-display-template').html();
				var template = Handlebars.compile(source);
				$contentContainer.append(template(spec));
			}
		});
	}
}