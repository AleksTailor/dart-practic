import 'dart:io';

void main() {
  while (true) { // Цикл для многократного использования калькулятора
    try {
      print('Введите выражение (например, 2 + 3) или "exit" для выхода:');

      // Считываем строку с вводом пользователя
      String? expression = stdin.readLineSync();

      // Проверяем, хочет ли пользователь выйти
      if (expression?.toLowerCase() == 'exit') {
        print('Программа завершена.');
        break;
      }

      // Проверяем, введён ли текст
      if (expression == null || expression.isEmpty) {
        print('Ошибка: выражение не введено. Пожалуйста, попробуйте снова.');
        continue;
      }

      // Разделяем строку на части (число, оператор, число)
      List<String> parts = expression.split(' ');

      // Проверяем корректность формата (должно быть 3 части: число оператор число)
      if (parts.length != 3) {
        print('Ошибка: некорректный формат выражения. Используйте «число оператор число».');
        continue;
      }

      // Преобразуем строки в числа (double для поддержки дробных чисел)
      double? num1 = double.tryParse(parts.trim());
      double? num2 = double.tryParse(parts.trim());

      if (num1 == null) {
        print('Ошибка: первое число некорректно. Пожалуйста, введите валидное число.');
        continue;
      }
      if (num2 == null) {
        print('Ошибка: второе число некорректно. Пожалуйста, введите валидное число.');
        continue;
      }

      // Оператор, введённый пользователем
      String operator = parts.trim();

      // Переменная для хранения результата
      double result;

      // Выполняем вычисление в зависимости от оператора
      switch (operator) {
        case '+':
          result = num1 + num2;
          break;
        case '-':
          result = num1 - num2;
          break;
        case '*':
          result = num1 * num2;
          break;
        case '/':
          if (num2 == 0) {
            print('Ошибка: деление на ноль невозможно!');
            continue;
          }
          result = num1 / num2;
          break;
        case '%':
          if (num2 == 0) {
            print('Ошибка: нельзя найти остаток от деления на ноль!');
            continue;
          }
          result = num1 % num2;
          break;
        default:
          print('Ошибка: неподдерживаемый оператор. Используйте +, -, *, /, %.');
          continue;
      }

      // Выводим результат
      print('Результат: $result');

      // Используем тернарный оператор для определения знака результата
      String signMessage = result >= 0 ? 'Результат положительный.' : 'Результат отрицательный.';
      print(signMessage);

      // Логический оператор для дополнительной проверки
      bool isIntegerResult = result == result.toInt().toDouble();
      String integerMessage = isIntegerResult ? 'Результат — целое число.' : 'Результат — дробное число.';
      print(integerMessage);

    } catch (e) {
      // Обработка неожиданных исключений
      print('Произошла непредвиденная ошибка: ${e.toString()}');
    }
  }
}

