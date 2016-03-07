// npm modules
var $ = require('jquery');
var Handlebars = require('handlebars');
var jqUI = require('jquery-ui');

// forms json
var per_person_json = require('./per_person.json');
var cc_form_json = require('./cc_payment_form.json');
var afterRender = require('./afterRender');
var submit = require('./submit');

var contentContainerClass = ".contentContainer";
var $contentContainer = $(contentContainerClass);

module.exports = {
	renderForm: function(formType, DEBUG) {

		var source = $('#sections-template').html();
		var template = Handlebars.compile(source);

		// Add form page
		$contentContainer.append(template(per_person_json));
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
		$('#btn-submit').on('click', submit.reservationSubmit(per_person_json));
	},
	
	renderCCPaymentForm: function(reservationID, DEBUG) {
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
				$('#cc-submit-btn').on('click', submit.paymentSubmit(reservationID, cc_form_json));
			}
		})
	}
}