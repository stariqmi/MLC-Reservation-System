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
		var a = document.createElement('a');
		a.href = "/forms/per_person";
		
		var $a = $(a);
		$a.text("Click me!");
		
		$contentContainer.append(a);
	});

	// Render respective form
	page('/forms/:formID', function(ctx) {
		// Maybe keep the link to the form
		$contentContainer.empty();
		
		// Register Partials
		var partialA = $('#text-datetime-input-template').html();
		Handlebars.registerPartial('inputDisplay', partialA);
		
		var partialB = $('#reservation-submit-template').html();
		Handlebars.registerPartial('reservationSubmit', partialB);
		
		var ccPartial = $("#payment-template").html();
		Handlebars.registerPartial('ccPayment', ccPartial);
		
		var formID = ctx.params.formID;
		
		// Second argument is debug flag
		render.renderForm(formID, false);
	});
	
	page('/admin/schedule', function() {
		$contentContainer.empty();
		render.renderCalendar();
	});
	
	page('/admin/reservations/:year/:month/:day', function(ctx) {
		$contentContainer.empty();
		
		var partial = $('#reservation-display-partial-template').html();
		Handlebars.registerPartial('reservationDisplay', partial);
		
		render.renderReservationsByDate(ctx.params.year, ctx.params.month, ctx.params.day);
	});
	
	page('/admin/reservations/:id', function(ctx) {
		$contentContainer.empty();
		
		// Register Helper
		var partial = $('#transaction-info').html();
		Handlebars.registerPartial('transactionInfo', partial);
		
		partial = $('#employee-email').html();
		Handlebars.registerPartial('employeeEmail', partial);
		
		// Second parameter is for admin flag
		render.renderReservation(ctx.params.id, true);
	});
	
	page('/reservations/:id', function(ctx) {
		$contentContainer.empty();
		
		// Second parameter is for admin flag
		render.renderReservation(ctx.params.id, false);
	});
	
	page('*', function() {
		$contentContainer.empty();
		$contentContainer.append('<h1>Miami Limo Coach Reservations</h1>');
		$contentContainer.append('<p>404 -The page you are looking for does not exists.</p>');
	})
	
	page.start({
		hashbang: true
	});
});