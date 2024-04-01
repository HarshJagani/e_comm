class ECValidator {
  static String? validateEmail(String? value) {
    if (value == null) return 'Please enter your email';

    // Regular expression for basic email validation
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$')
        .hasMatch(value)) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }
// Regular expression for basic email validation
  static String? validatePassword(String? value) {
    if (value == null || value.length < 8) {
      return "Password must be at least 8 characters long";
    }

    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter.';
    }
    if (!value.contains(RegExp('[1-9]'))) {
      return 'Password must contain at least one a number.';
    }
    if (!value.contains( RegExp(r'[\.\/\-\!\,\:\;\(\)\{\}\[\]\?\*\&\@\#\$\%]'))) {
      return 'Password must contain at least one symbol';
  }
  if(!value.contains(RegExp(r'[a-z]'))){
    return 'Password must contain at least one lowercase letter.';
  }
  return null;
}
 //Validation for empty fields.
static String? validateEmptytext(String? fieldNmae, String? value){
  if(value == null || value.isEmpty){
    return '$fieldNmae is reqired.';
  }
  return null;
}

static String? validatenumber(String? value){
    if(!RegExp(r'[0-9]').hasMatch(value!) && value.length != 10){
       return 'Please enter the phone number in correct format';
     }else{
      return null;
   
    }
  }
}