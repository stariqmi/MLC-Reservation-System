// npm modules
var page = require('page');
var $ = require('jquery');

// local modules
var render = require('./render.js');
var templateUtils = require('./utils/templates.js');

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
		var formID = ctx.params.formID;
		
		// Second argument is debug flag
		render.renderForm(formID, false);
	});
	
	page('/admin/clndr', function() {
		$contentContainer.empty();
		render.renderCalendar();
	});
	
	page('/admin/reservations/:year/:month/:day', function(ctx) {
		$contentContainer.empty();
		
		render.renderReservationsByDate(ctx.params.year, ctx.params.month, ctx.params.day);
	});
	
	page('/admin/reservations/:id', function(ctx) {
		$contentContainer.empty();
		
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