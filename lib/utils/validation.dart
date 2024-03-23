class TextValidation {
  static String? emailValidation(String? value, {bool required = true}) {
    if (!required) {
      if (value != null || value!.trim().isNotEmpty) if (!RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value)) return 'Email address is not valid';
    } else {
      if (value == null || value.trim().isEmpty) {
        return 'Email required';
      } else if (!RegExp(
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
          .hasMatch(value)) {
        return 'Email address is not valid';
      }
    }
    return null;
  }

  static String? userNameVali(String? text) {
    if (text!.isEmpty) {
      return "This field can't be empty";
    } else if (text.length < 3) {
      return "Username should be at least 3 characters long";
    } else if (text.length > 15) {
      return "Username shouldn't be greater than 15 characters";
    } else if (text.contains(" ")) {
      return "Username shouldn't contain a space character";
    } else
      return null;
  }
}
