// npm modules
var page = require('page');
var $ = require('jquery');
var Handlebars = require('handlebars');

// custom modules
var validate = require('./validateFuncs');

module.exports = {
    reservation: function(form_specs) {
            return function() {
                var isValidReservation = true;
                var reservationInfo = {};
                
                for (var si in form_specs.sections) {
            		for (var fi in form_specs.sections[si].fields) {
            			var field = form_specs.sections[si].fields[fi];
            			var $errorInfo = $('#' + field.id + '-container .error-info');
                        
            			if (field.required && field.validate) {
                            var value = $('#' + field.id).val();
                            var isValid = validate[field.validate];
                            if (isValid(value)) {
                                $errorInfo.hide();
                                reservationInfo[field.id] = value;
                                
                            }
                            else {
                                isValidReservation = false;
                                $errorInfo.show();
                            }
                        }
            		}
            	}
                
                if (isValidReservation) {
                    reservationInfo['status'] = 'pre-payment'; // i.e the payment has not been processed
                    
                    // Add pickup month, day, year
                    var pickup_data = reservationInfo.pickup_date.split('/');
                    reservationInfo.pickup_month = parseInt(pickup_data[0]);
                    reservationInfo.pickup_day = parseInt(pickup_data[1]);
                    reservationInfo.pickup_year = parseInt(pickup_data[2]);
                    reservationInfo.form_type = form_specs.name;
                    
                    $.ajax('/pre-payment/save', {
                        method: 'post',
                        data: JSON.stringify(reservationInfo),
                        dataType: 'json',
                        success: function(data, status) {
                            // Pass data to next handler
                            page('/forms/cc/payment/' + data._id.$oid);
                        }
                    });
                    
                }
            }
        },
        
        payment: function(reservationID, form_specs) {
            return function() {
                var validCCInfo = true;
                var ccInfo = {};
                
                // Check if field value is valid or not
                for (fi in form_specs.fields) {
                    var field = form_specs.fields[fi];
                    var value = $('#' + field.id).val();
                    var isValid = validate[field.validate];
                    var $errorMessage = $('#' + field.id + '-container .error-info');
                    
                    if (isValid(value)) {
                        ccInfo[field.id] = value;
                        
                        $errorMessage.hide();
                    }
                    else {
                        validCCInfo = false;
                        $errorMessage.show();
                    }
                }
                
                if (validCCInfo) {
                    // Show loading
                    $('#loading').show();
                    
                    // Send reservationID along
                    ccInfo.reservationID = reservationID;
                    
                    // Disable all buttons
                    // Loading overlay
                    
                    // Process payment and get result
                    $.ajax('/process/payment', {
                        method: 'post',
                        dataType: 'json',
                        data: JSON.stringify(ccInfo),
                        success: function(data, status) {
                            /*
                            // Uncomment this when you have processing working
                            // Empty fields for user data protection
                            // Render reservation details page
                            $('#loading').hide();
                            
                            // This should redirect to reservation display
                            page('/reservations/' + reservationID);
                            */
                        }
                    });
                    
                }
            }
        }
}