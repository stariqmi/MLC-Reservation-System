// npm modules
var $ = require('jquery');
var page = require('page');

// utils
var loadingUtils = require('./loading.js');
var ajaxUtils = require('./ajax.js');

module.exports = {
    reservationDeleteBtnClick: function(reservationID) {
        return function(e) {
            loadingUtils.show();
            ajaxUtils.makeRequest('DELETE', '/reservations/' + reservationID)
            .then(function(data) {
                loadingUtils.hide();
                if (data.status === 'ok') page('/admin/clndr');
                else alert('Can not delete, please contact your developer');
            });
        }
    },

    employeeNotifyBtnClick: function(reservationID) {
        return function(e) {
            e.preventDefault();
            loadingUtils.show('Sending email ...');
            
            var data = $('.email-form select').val().split('/');
            var email = data[0];
            var number = data[1];
            ajaxUtils.makeRequest('POST', '/employees/email_reservation', {
                reservation_id: reservationID,
                to: email
            })
            .then(function(data) {
                loadingUtils.show('Sending SMS ...');
                return ajaxUtils.makeRequest('POST', '/employees/sms_reservation', {
                    reservation_id: reservationID,
                    to: number
                });
            })
            .then(function(data) {
                if (data.error) loadingUtils.show('Unable to process request ...');
                loadingUtils.hide();
            })
            .catch(function(err) {
                console.log(err);
            });
        }
    }
}