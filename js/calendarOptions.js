// npm mpodules
var $ = require('jquery');
var Fullcalendar = require('fullCalendar');
var page = require('page');

module.exports = {
    // Event source
    events: function(start, end, timezone, cb) {
        $('#loading').show();
        
        // Query by start and end month
        var dataUrl = '/reservations/' + start.month() + '/' + end.month();
        $.ajax(dataUrl, {
            method: 'get',
            success: function(data, status) {
                for (var di in data) {
                    data[di].title = data[di].lname + '-' + data[di].pickup_time;
                    data[di].allDay = true;
                    data[di].start = $.fullCalendar.moment(data[di].pickup_date, 'MM/DD/YYYY');
                }
                
                $('#loading').hide();	
                cb(data);
            }
        });
    },
    eventClick: function(event) {
        page('/reservations/' + event._id.$oid);
    },
    dayClick: function(day) {
        // alert('WIP');
    }
};