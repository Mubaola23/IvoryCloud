class ValidationMixin {
  String validateNotEmpty(String value) =>
      value.isEmpty ? 'Field cannot be empty' : null;

  String validateFullName(String value) =>
      value.split(' ').length < 2 ? 'Enter a valid Full Name' : null;

  String validateEmail(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return !emailValid ? 'Enter a Valid Email Address' : null;
  }

  String validateNotNullEmail(String value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value);
    return value.isEmpty
        ? null
        : !emailValid
            ? 'Enter a Valid Email Address'
            : null;
  }

  String validatePhoneNumber(String value) =>
      value.length < 10 ? 'Enter a Valid Phone Number' : null;

  String validatePassword(String value) =>
      value.length < 6 ? 'Password should be more than 5 Characters' : null;

  String validateConfirmPassword(String value, String password) =>
      value != password ? 'Passwords do not match' : null;

  String validateOtp(String value, String otp) =>
      value.length < 4 || value != otp ? 'Enter valid OTP' : null;

  String validateGender(String value) =>
      value == 'Gender' ? 'Choose one of male or female' : null;
}
