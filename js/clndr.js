// npm modules
var $ = require('jquery');
var moment = require('moment');
var clndr = require('clndr');
var clone = require('clone');

// local modules and utils
var loadingUtils = require('./utils/loading.js');
var templateUtils = require('./utils/templates.js');
var ajaxUtils = require('./utils/ajax.js');
var status_json = require('./status.json');

var contentContainerClass = ".contentContainer";
var $contentContainer = $(contentContainerClass);

// Renders clndr.js calendar
module.exports = function(reservations) {
    
    templateUtils.registerHelper('makeWeeks', function(hbs, templates) {
        return function(days) {
            var clonedDays = clone(days);
            
            for (var di in clonedDays) {
                var day = clonedDays[di];
                day.year = day.date.get('year');
                day.month = day.date.get('month') + 1;
            }
            
            var weeks = [];
            while(clonedDays.length) {
                weeks.push(clonedDays.splice(0, 7));
            }
            
            var template = templates['week'];
            
            for (var wi in weeks) {
                weeks[wi] = template({days: weeks[wi]});
            }
            
            return new hbs.SafeString(weeks.join(""));
        }
    });
    
    for (var ri in reservations) {
        var reservation = reservations[ri];
        var date = moment(reservation.pickup_date, 'MM/DD/YYYY');
        reservation.moment = moment;
        reservation.date = date.toISOString();
    }
    
    templateUtils.render({
        name: 'calendar',
        data: status_json
    })
    
    var visitedMonths = {};
    visitedMonths[moment().month() + 1] = true;
    
    var onMonthChange = function(m) {
        
        var instance = this;    // clndr instance
        var month = m.month() + 1;
        
        // (de)activate today button
        var currentMonth = moment().month() + 1;
        
        var todayDisabled = (currentMonth === month);
        $('#today-button').attr('disabled', todayDisabled);
        
        // Load data only if data for this month hasnt been loaded
        if (!visitedMonths[month]) {
            loadingUtils.show();
            
            // visit month
            visitedMonths[month] = true;
            
            ajaxUtils.makeRequest('GET', '/reservations/' + month + '/' + month)
            .then(function(data) {
                for (var di in data) {
                    var d = data[di];
                    var date = moment(d.pickup_date, 'MM/DD/YYYY');
                    d.moment = moment;
                    d.date = date.toISOString();
                }
                
                instance.addEvents(data);
                loadingUtils.hide();
            })
        }
    }

    
    $('#calendar').clndr({
        render: function(data) {
            return templateUtils.fetch('clndr')(data);
        },
        events: reservations,
        forceSixRows: true,
        ready: function() {
            $('#today-button').attr('disabled', true);
        },
        doneRendering: function() {
            loadingUtils.hide();
        },
        clickEvents: {
            onMonthChange: onMonthChange
        }
    });
}