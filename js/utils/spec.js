// npm modules
var clone = require('clone');

// Specs
var per_person_json = require('../form_specs/per_person.json');
var total_price_json = require('../form_specs/total_price.json');
var hourly_rate_json = require('../form_specs/hourly_rate.json');

module.exports = {
    get: function(type) {		
		var spec;
        
        // Need to clone it so that the source spec doesnt get polluted
		switch (type) {
			case 'pp':
            case 'per_person':
				spec = clone(per_person_json);
				break;
			case 'tp':
            case 'total_price':
				spec = clone(total_price_json);
				break
			case 'hr':
            case 'hourly_rate':
				spec = clone(hourly_rate_json);
				break;
			default:
				spec = false;
                break
		}
        
        return spec;
    }
}