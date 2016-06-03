var Handlebars = require("hbsfy/runtime");
var $ = require('jquery');

// Require all partials
var partials = {
    payment: require('../templates/hbs/payment.hbs'),
    reservation_submit: require('../templates/hbs/reservation_submit.hbs'),
    text_datetime_input: require('../templates/hbs/text_datetime_input.hbs')
};

// Require all templates
var templates = {
    form: require('../templates/hbs/form.hbs'),
    week: require('../templates/hbs/week.hbs'),
    calendar: require('../templates/hbs/calendar.hbs'),
    clndr: require('../templates/hbs/clndr.hbs')
};

Handlebars.partials = partials;

var contentContainerClass = ".contentContainer";
var $contentContainer = $(contentContainerClass);

module.exports = {
    render: function(options) {
        
        var template = templates[options.name];
        $contentContainer.append(template(options.data));
    },
    
    fetch: function(name) {
        return templates[name];
    },
    
    registerHelper: function(helper_name, func) {
        var helper_func = func(Handlebars, templates);
        Handlebars.registerHelper(helper_name, helper_func);
    }
}
