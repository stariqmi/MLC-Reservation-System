module.exports = {
    makeClickableEmail: function($el, value) {
        $el.html('<a href="mailto:' + value + '">' + (value || '') + '</a>' );
    },
    makeClickableTel: function($el, value) {
        $el.html('<a href="tel:' + value + '">' + (value || '') + '</a>' );
    }
}