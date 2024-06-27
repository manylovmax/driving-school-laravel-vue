import PhoneNumber from 'awesome-phonenumber';

const phoneNumberValidator = {
	getMessage: field => `${field} is not a valid phone number`,
	validate (value) {
		return new Promise(resolve => {
			let phone = new PhoneNumber(value, 'RU');
			resolve({ valid: phone.isValid() });
		});
	}
};

export default phoneNumberValidator;
