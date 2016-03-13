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
    
    var visitedMonths = {};
    visitedMonths[moment().month() + 1] = true;
    
    var onMonthChange = function(m) {
        var instance = this;    // clndr instance
        var month = m.month() + 1;
        
        // Load data only if data for this month hasnt been loaded
        if (!visitedMonths[month]) {
            console.log('Requesting events for: ' + month);
            // visit month
            visitedMonths[month] = true;
            
            $.ajax('/reservations/' + month + '/' + month, {
                method: 'GET',
                success: function(data, status) {
                    
                    for (var di in data) {
                        var d = data[di];
                        var date = moment(d.pickup_date, 'MM/DD/YYYY');
                        d.moment = moment;
                        d.date = date.toISOString();
                    }
                    
                    instance.addEvents(data);
                }
            });
        }
    }
    
    $('#calendar').clndr({
        render: function(data) {
            return clndrTemplate(data);
        },
        events: reservations,
        forceSixRows: true,
        doneRendering: function() {
            $('#loading').hide();
        },
        clickEvents: {
            onMonthChange: onMonthChange
        }
    });
}