// npm modules
var $ = require('jquery');
var Handlebars = require('handlebars');;
var moment = require('moment');
var clndr = require('clndr');
var clone = require('clone');

// local modules
var status_json = require('./status.json');

var contentContainerClass = ".contentContainer";
var $contentContainer = $(contentContainerClass);

// Renders clndr.js calendar
module.exports = function(reservations) {
    
    Handlebars.registerHelper('makeWeeks', function(days) {
        var clonedDays = clone(days);
        
        var weeks = [];
        while(clonedDays.length) {
            weeks.push(clonedDays.splice(0, 7));
        }
        
        var source = $('#week-template').html();
        var template = Handlebars.compile(source);
        
        for (var wi in weeks) {
            weeks[wi] = template({days: weeks[wi]});
        }
        
        return new Handlebars.SafeString(weeks.join(""));
    });
    
    for (var ri in reservations) {
        var reservation = reservations[ri];
        var date = moment(reservation.pickup_date, 'MM/DD/YYYY');
        reservation.moment = moment;
        reservation.date = date.toISOString();
    }
    
    var source = $('#calendar-template').html();
    var template = Handlebars.compile(source);
    
    $contentContainer.html(template(status_json));
    
    var clndrSource = $('#clndr-template').html();
    var clndrTemplate = Handlebars.compile(clndrSource);
    
    $('#calendar').clndr({
        render: function(data) {
            return clndrTemplate(data);
        },
        events: reservations,
        forceSixRows: true,
        doneRendering: function() {
            $('#loading').hide();
        }
    });
}