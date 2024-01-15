class RegexTypes {
  static RegExp get emailRegex => RegExp(r"^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+$");
  static RegExp get passwordRegex =>
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$");
  static RegExp get nameRegex =>
      RegExp(r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$");
  static RegExp get phoneRegex => RegExp(r"^[0-9]{10}$");
  static RegExp get otpRegex => RegExp(r"^[0-9]{6}$");
  static RegExp get pincodeRegex => RegExp(r"^[0-9]{6}$");
  static RegExp get addressRegex => RegExp(r"^[a-zA-Z0-9\s,.'-]{3,}$");
  static RegExp get cityRegex => RegExp(r"^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$");
  static RegExp get stateRegex => RegExp(r"^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$");
  static RegExp get countryRegex => RegExp(r"^[a-zA-Z]+(?:[\s-][a-zA-Z]+)*$");
  static RegExp get landmarkRegex => RegExp(r"^[a-zA-Z0-9\s,.'-]{3,}$");
}
