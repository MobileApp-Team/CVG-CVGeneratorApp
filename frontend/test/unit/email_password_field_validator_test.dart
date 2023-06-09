// import 'package:../lib/login/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('empty email returns error string', () {
    final result = EmailFieldValidator.validate('');
    expect(result, 'Email can\'t be empty');
  });

  test('non-empty email returns null', () {
    final result = EmailFieldValidator.validate('email');
    expect(result, null);
  });

  test('empty password returns error string', () {
    final result = PasswordFieldValidator.validate('');
    expect(result, 'Password can\'t be empty');
  });

  test('non-empty password returns null', () {
    final result = PasswordFieldValidator.validate('password');
    expect(result, null);
  });
}

class EmailFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? 'Email can\'t be empty' : null;
  }
}
class PasswordFieldValidator {
  static String? validate(String value) {
    return value.isEmpty ? 'Password can\'t be empty' : null;
  }
}
