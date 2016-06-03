// npm modules
var page = require('page');
var $ = require('jquery');
var Handlebars = require('handlebars');

// custom modules and utils
var loadingUtils = require('./utils/loading.js');
var ajaxUtils = require('./utils/ajax.js');
var validate = require('./validateFuncs');
var cc_form_json = require('./form_specs/cc_payment_form.json');

/**
 * Validates a reservation based on the spec of the form
 * @param  object form_specs    spec of the form with field metadata
 * @return object               object containing information on wether the
 *                              info is valid and the information from the form
 */
function validateReservationInfo(form_specs) {
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
    
    return {isValid: isValidReservation, info: reservationInfo};
}

/**
 * Validate the CC information based on the cc_form_json spec
 * @return object infromation containing wether the cc info is valid and the info itself
 */
function validateCCInfo() {
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
    
    return {isValid: isValidCCInfo, info: ccInfo};
}

/**
 * Check if the cc info from the user is empty i.e it is just a reservation
 * @param  object  ccInfo   information collected from the user
 * @return boolean          wether the CC infor supplied is empty or not
 */
function isCCEmpty(ccInfo) {
    // Check if person is only making a reservation
    var ccEmpty = true;
    for (var ci in ccInfo) {
        if (ccInfo[ci] !== "") {
            ccEmpty = false;
            break;
        }
    }
    
    return ccEmpty;
}

module.exports = {
    reservationWithCC: function(form_specs) {
            return function() {
                
                var reservationCheck = validateReservationInfo(form_specs);
                var isValidReservation = reservationCheck.isValid;
                var reservationInfo = reservationCheck.info;
                
                var ccCheck = validateCCInfo()
                var isValidCCInfo = ccCheck.isValid;
                var ccInfo = ccCheck.info;
                
                var ccEmpty = isCCEmpty(ccInfo);
                if (!ccEmpty) {
                    $('#payment-container .error-info').hide();
                    isValidCCInfo = true;
                    reservationInfo.reservation_only = true;
                    reservationInfo.status = 'pre-payment';
                }
                else {
                    reservationInfo.reservation_only = false;
                    reservationInfo.status = 'reservation-only';
                }
                
                if (isValidReservation && isValidCCInfo) {
                    loadingUtils.show();
                    
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
                    
                    ajaxUtils.makeRequest('post', '/reservation', JSON.stringify(requestData))
                    .then(function(data) {    
                        loadingUtils.hide();
                        
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
                            $("#error-indication").show();
                        }
                    });
                    
                }
                else {
                    $("#error-indication").show();
                }
            }
        }
}