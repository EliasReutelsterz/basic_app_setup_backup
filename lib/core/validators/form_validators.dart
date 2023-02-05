class FormValidators {
  late String email;
  late String username;
  late String password;
  String? validate_email(String? input) {
    const emailRegex =
        r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[-a-zA-Z0-9]+\.[a-zA-Z]+""";

    if (input == null || input.isEmpty) {
      return "please enter your email";
    } else if (RegExp(emailRegex).hasMatch(input)) {
      email = input;
      return null;
    } else {
      return "invalid email format";
    }
  }

  String? validate_username(String? input) {
    const usernameRegex =
        r"""^(?=.{3,15}$)(?![_.])(?!.*[_.]{2})[a-z0-9._]+(?<![_.])$""";
    if (input == null || input.isEmpty) {
      return "please enter your username";
    } else if (!RegExp(usernameRegex).hasMatch(input)) {
      if (input != input.toLowerCase()) {
        return "Only use lower characters";
      } else if (input.length < 3) {
        return "Use at least 3 characters";
      } else if (input.length > 15) {
        return "Use less than 16 characters";
      } else {
        return "Invalid special characters";
      }
    } else {
      username = input;
      return null;
    }
  }

  String? validate_password(String? input) {
    if (input == null || input.isEmpty) {
      return "please enter your password";
    } else if (input.length >= 6) {
      password = input;
      return null;
    } else {
      return "Use at least 6 characters";
    }
  }
}
