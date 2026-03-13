import 'dart:io';

class PasswordValidator {
  static const int minLength = 8;
  static const String requiredDigits = '0123456789';

  static bool validate(String password) {
    if (password.length < minLength) return false;
    for (int i = 0; i < password.length; i++) {
      if (requiredDigits.contains(password[i])) return true;
    }
    return false;
  }
}

void main() {
  // Тестовые пароли
  List<String> testPasswords = [
    'abc123',
    'abcdefgh',
    'abcd1234',
    '12345678',
    'qwertyui',
    'qwerty1',
    '',
    '   ',
  ];

  for (String pwd in testPasswords) {
    bool result = PasswordValidator.validate(pwd);
    print('Пароль: "${pwd}" -> ${result ? '✅' : '❌'}');
  }
  while (true) {
    stdout.write('Введите пароль (exit для выхода): ');
    String? input = stdin.readLineSync();
    if (input == null || input.toLowerCase() == 'exit') break;
    print(PasswordValidator.validate(input) ? '✅' : '❌');
  }
}