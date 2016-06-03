// npm modules
var $ = require('jquery');

var select = '#loading';
var text_selector = '#loading .text';

module.exports = {
    show: function(message) {
        $(select).show();
        if (message) $(text_selector).text(message);
    },
    
    hide: function() {
        $(select).hide();
        $(text_selector).text('');
    }
}