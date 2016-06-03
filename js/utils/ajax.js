// npm modules
var $ = require('jquery');
var Promsie = require('bluebird');

module.exports = {
    makeRequest: function(type, url, data) {
        return new Promise(function(resolve, reject) {
            $.ajax(url, {
                method: type,
                data: data || {},
                dataType: 'json',
                success: function(data, status) {
                    resolve(data);
                }
            });
        });
    }
}