// npm modules
var $ = require('jquery');
var page = require('page');

// utils
var loadingUtils = require('./loading.js');
var ajaxUtils = require('./ajax.js');

module.exports = {
    reservationDeleteBtnClick: function() {
        loadingUtils.show();
        ajaxUtils.makeRequest('DELETE', '/reservations/' + reservationID)
        .then(function(data) {
            loadingUtils.hide();
            if (data.status === 'ok') page('/admin/clndr');
            else alert('Can not delete, please contact your developer');
        });
    }
}