 String? validateEmail(String v) {
    if (v.isEmpty) return 'Enter your email';
    if (!v.contains('@')) return 'Enter a valid email';
    return null;
  }

  String? validatePassword(String v) {
    if (v.isEmpty) return 'Enter your password';
    if (v.length < 6) return 'Password too short';
    return null;
  }
  String? validateName(String v) {
  if (v.trim().isEmpty) return 'Enter your name';

  if (v.trim().length < 3) {
    return 'Name must be at least 3 characters';
  }

  final nameRegex = RegExp(r'^[a-zA-Z ]+$');

  if (!nameRegex.hasMatch(v.trim())) {
    return 'Only letters allowed';
  }

  return null;
}
String? validatePhone(String v) {
  if (v.trim().isEmpty) return 'Enter your phone number';

  final phoneRegex = RegExp(r'^[6-9]\d{9}$');

  if (!phoneRegex.hasMatch(v.trim())) {
    return 'Enter a valid 10-digit number';
  }

  return null;
}