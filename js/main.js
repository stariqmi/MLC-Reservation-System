// npm modules
var page = require('page');
var $ = require('jquery');
var Handlebars = require('handlebars');

// local modules
var render = require('./render.js');

$(document).ready(function() {

	var contentContainerClass = ".contentContainer";
	var $contentContainer = $(contentContainerClass);
	
	// Register Helpers

	// Render Home page
	page('/', function() {
		console.log('hello2');
		var a = document.createElement('a');
		a.href = "/forms/per_person";
		
		var $a = $(a);
		$a.text("Click me!");
		console.log($a);
		
		$contentContainer.append(a);
	});

	// Render respective form
	page('/forms/:formID', function(ctx) {
		// Maybe keep the link to the form
		$contentContainer.empty();
		
		// Register Partials
		var partial = $('#text-datetime-input-template').html();
		Handlebars.registerPartial('inputDisplay', partial);
		
		var formID = ctx.params.formID;
		// Second argument is debug flag
		render.renderForm(formID, true);
	});
	
	page('/forms/cc/payment/:id', function(ctx) {
		$contentContainer.empty();
		
		// Register Partials
		var partial = $('#credit-card-info-template').html();
		Handlebars.registerPartial('creditCardForm', partial);
		
		// Render content using above templates and headers
		render.renderCCPaymentForm(ctx.params.id, true);
	});
	
	page('/calendar', function() {
		$contentContainer.empty();
		render.renderCalendar();
	});
	
	page('/reservations/:id', function(ctx) {
		$contentContainer.empty();
		render.renderReservation(ctx.params.id);
	});
	
	page.start({
		hashbang: true
	});
});