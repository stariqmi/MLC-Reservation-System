// npm modules
var page = require('page');
var $ = require('jquery');
var Handlebars = require('handlebars');

// custom modules
var validate = require('./validateFuncs');
var cc_form_json = require('./cc_payment_form.json');

module.exports = {
    reservationWithCC: function(form_specs) {
            return function() {
                
                var isValidReservation = true;
                var reservationInfo = {};
                
                for (var si in form_specs.sections) {
            		for (var fi in form_specs.sections[si].fields) {
            			var field = form_specs.sections[si].fields[fi];
            			var $errorInfo = $('#reservation-form-container ' + '#' + field.id + '-container .error-info');
                        
                        var value = $('#reservation-form-container ' + '#' + field.id + '-container ' + '#' + field.id).val();
                        reservationInfo[field.id] = value;
            			
                        if (field.required && field.validate) {
                            var isValid = validate[field.validate];
                            if (isValid(value)) {
                                $errorInfo.hide();
                            }
                            else {
                                isValidReservation = false;
                                $errorInfo.show();
                            }
                        }
            		}
            	}
                
                var isValidCCInfo = true;
                var ccInfo = {};
                
                // Check if field value is valid or not
                for (fi in cc_form_json.fields) {
                    var field = cc_form_json.fields[fi];
                    var $field = $('#payment-container ' + '#' + field.id);
                    var value = $field.val();
                    var isValid = validate[field.validate];
                    var $errorMessage = $('#payment-container ' + '#' + field.id + '-container .error-info');
                    
                    if (field.required) {
                        if (isValid(value)) {
                            ccInfo[field.id] = value;
                            $errorMessage.hide();
                        }
                        else {
                            isValidCCInfo = false;
                            $errorMessage.show();
                        }
                    }
                    // If not required then pass the value as is
                    else {
                        ccInfo[field.id] = value;
                    }
                }
                
                // Check if person is only making a reservation
                var ccEmpty = true;
                for (var ci in ccInfo) {
                    if (ccInfo[ci] !== "") {
                        ccEmpty = false;
                        break;
                    }
                }
                
                if (ccEmpty) {
                    $('#payment-container .error-info').hide();
                    isValidCCInfo = true;
                    reservationInfo.reservation_only = true;
                }
                else {
                    reservationInfo.reservation_only = false;
                }
                
                if (isValidReservation && isValidCCInfo) {
                    $('#loading').show();
                    reservationInfo['status'] = (ccEmpty) ? 'reservation-only' : 'pre-payment';
                    
                    // Add pickup month, day, year
                    var pickup_data = reservationInfo.pickup_date.split('/');
                    reservationInfo.pickup_month = parseInt(pickup_data[0]);
                    reservationInfo.pickup_day = parseInt(pickup_data[1]);
                    reservationInfo.pickup_year = parseInt(pickup_data[2]);
                    reservationInfo.form_type = form_specs.name;
                    
                    var requestData = {reservation: reservationInfo, cc: ccInfo};
                    if (window.retry) {
                        requestData.retry = true;
                        requestData.reservationID = window.reservationID;
                    }
                    
                    console.log(requestData);
                    $.ajax('/reservation_with_cc', {
                        method: 'post',
                        data: JSON.stringify(requestData),
                        dataType: 'json',
                        success: function(data, status) {
                            
                            console.log(data);
                            $('#loading').hide();
                            
                            if (data.status === 'ok' && data.resultCode === 'A') {
                                // Clear out "session"
                                if (window.retry) {
                                    delete window.retry;
                                    delete window.reservationID;
                                }
                                page('/reservations/' + data.reservation._id.$oid);
                            }
                            else {
                                window.retry = true;
                                window.reservationID = data.reservation._id.$oid;
                                $(".transaction.error-info").html(data.error);
                                $(".transaction.error-info").show();
                            }
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
                            
                            // Uncomment this when you have processing working
                            $('#loading').hide();
                            if (data.resultCode === 'E') {
                                $(".transaction.error-info").html(data.error);
                                $(".transaction.error-info").show();
                            }
                            else {
                                page('/reservations/' + reservationID);
                            }
                            
                        }
                    });
                    
                }
            }
        }
}