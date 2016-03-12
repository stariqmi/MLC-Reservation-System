module.exports = {
    noop: function() {
        return true;
    },
    
    isNotEmpty: function(value) {
        return value.length !== 0;
    },
    
    isValidEmail: function(email) {
        return email.length !== 0; // Do a regex test
    },
    
    isValidTime: function(time) {
        var re = /[0-9]{1,2}[:][0-9]{1,2}\s((AM)|(PM))/;
        return re.test(time); // Do a regex test hh:mm AM|PM
    },
    
    isValidExpiry: function(expiry) {
        var re = /[0-9]{4}/;
        return re.test(expiry);
    },
    
    isValidAmount: function(amount) {
        var re = /[0-9]+/;
        return re.test(amount);
    }
}