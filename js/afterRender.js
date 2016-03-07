var jqUI = require('jquery-ui');

module.exports = {
    convertToDatepicker: function(element) {
        element.datepicker();
    },
    
    fillFullName: function(element, reservation) {
        element.val(reservation.fname + ' ' + reservation.lname);
    }
};