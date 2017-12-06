//reference of dbconnection.js
var mysql_pool = require('../DBConnection');

var UserDetails = {

		checkLoginDetails: function(username, encrypted_pwd) {
			return new Promise( (resolve, reject) => {
				mysql_pool.query(" SELECT username, primary_contact_name, secondary_contact_name, company.company_id, company_name FROM " +
								 " user LEFT JOIN company ON user.company_id = company.company_id " +
								 " WHERE username = ? AND encrypted_pwd = ? AND isActive = 1",
						 		 [ username, encrypted_pwd ], (error, result) => {
					if(error) {
						return reject(error);
					}

					return resolve(result);
				});
			});
		},

		getCompanyRole: function(company_id) {
			return new Promise( (resolve, reject) => {
				mysql_pool.query(" SELECT company_type FROM company_category LEFT JOIN " +
										  " company_type ON company_category.company_type_id = company_type.company_type_id " +
										  " WHERE company_category.company_id = ? ", [company_id], (error, result) => {
					if(error) {
						return reject(error)
					}
					return resolve(result);
				}); 
			});
		}
};

module.exports = UserDetails;