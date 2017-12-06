//Dependencies
var express = require('express');
var router = express.Router();
var UserDetails = require('../models/UserDetails');
var Utils = require('../utils/GenericFunctions');

/**
 * Used to Authenticate User and if user credentials are correct return 
 */
router.post('/login', function(req, res) {
    var username, password;
    if (!Utils.empty(req.body.implPartnerUsername) && !Utils.empty(req.body.implPartnerPassword)) {
        username = req.body.implPartnerUsername;
        password = req.body.implPartnerPassword;
    } 
	
    console.log("username: " + username + ", password: " + password);

    var userObj = {};

    UserDetails.checkLoginDetails(username, password)
    	.then(results => {
    		console.log(results);
            if(results.length === 0) {
            	throw new Error("No User Found");
            } else {
            	const company_id = results[0].company_id;
            	userObj = results[0];
            	return UserDetails.getCompanyRole(company_id);
            }
    	})
    	.then(results => {
    		console.log("userObj: ", userObj);
    		let companyTypeArray = [];
	        if(results !== undefined && results.length > 0) {
	            for (var key in results) {
					if (results.hasOwnProperty(key)) {
						var val = results[key];
						if(val.hasOwnProperty('company_type')) {
							companyTypeArray.push(val['company_type']);
						}
					}
				}
			} // End of if loop

	        var companyTypeValues = companyTypeArray.join();
	        userObj.company_type = companyTypeValues;
	            		
	        console.log(userObj);
	        res.json(userObj);
    	})
    	.catch(error => {
    		console.log(error.message);
    		// Return empty arry indicating No User Found
	        res.json([]);
    	})
})

//Return router
module.exports = router;