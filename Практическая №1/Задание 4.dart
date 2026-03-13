import 'dart:io';
import 'dart:math';

void main() {
  print('Умный калькулятор');
  
  bool continueCalculating = true;
  
  while (continueCalculating) {
    try {
      // Используем тернарный оператор для проверки первого запуска
      String? input = _getUserInput();
      
      // Используем null-безопасность с оператором ??
      List<String> parts = (input?.split(' ') ?? []);
      
      // Логические операторы для валидации
      if (parts.length != 3) {
        throw FormatException('Неверный формат ввода. Используйте: число оператор число');
      }
      
      // Парсим числа с проверкой
      double? num1 = double.tryParse(parts[0]);
      String operator = parts[1];
      double? num2 = double.tryParse(parts[2]);
      
      // Проверка на null с использованием ?? и логических операторов
      if (num1 == null || num2 == null) {
        throw FormatException('Ошибка: введите корректные числа');
      }
      
      // Выполняем вычисление
      double result = calculate(num1, num2, operator);
      
      // Используем тернарный оператор для форматирования вывода
      String resultText = result == result.toInt() 
          ? result.toInt().toString() 
          : result.toStringAsFixed(2);
      
      print('\n✅ Результат: $num1 $operator $num2 = $resultText');
      
    } catch (e) {
      print('❌ Ошибка: $e');
    }
    
    // Спрашиваем, хочет ли пользователь продолжить
    continueCalculating = _askToContinue();
  }
  
  print('До свидания!');
}

double calculate(double a, double b, String operator) {
  // Используем switch с разными типами операторов
  switch (operator) {
    case '+':
      return a + b;
    case '-':
      return a - b;
    case '*':
      return a * b;
    case '/':
      // Проверка деления на ноль
      if (b == 0) {
        // ignore: deprecated_member_use
        throw IntegerDivisionByZeroException();
      }
      return a / b;
    case '%':
      // Проверка деления на ноль для остатка
      if (b == 0) {
        // ignore: deprecated_member_use
        throw IntegerDivisionByZeroException();
      }
      return a % b;
    case '^':
      return pow(a, b).toDouble();
    default:
      throw FormatException('Неизвестный оператор. Используйте: +, -, *, /, %, ^');
  }
}

String? _getUserInput() {
  print('\nВведите выражение (например: 10 + 5) или "exit" для выхода:');
  String? input = stdin.readLineSync();
  
  // Используем тернарный оператор и null-проверку
  return input?.toLowerCase() == 'exit' ? null : input;
}

bool _askToContinue() {
  print('\nХотите выполнить еще одно вычисление? (y/n):');
  String? answer = stdin.readLineSync();
  
  // Используем null-безопасность и логические операторы
  return answer?.toLowerCase() == 'y' || answer?.toLowerCase() == 'yes' || answer?.toLowerCase() == 'да';
}

// Дополнительный класс для демонстрации различных подходов
class CalculationHistory {
  final String expression;
  final double result;
  final DateTime timestamp;
  
  // Используем тернарный оператор в конструкторе
  CalculationHistory(this.expression, this.result)
      : timestamp = DateTime.now();
  
  @override
  String toString() {
    // Используем тернарный оператор
    String resultStr = result == result.toInt() 
        ? result.toInt().toString() 
        : result.toStringAsFixed(2);
    
    return '$expression = $resultStr [${timestamp.toString()}]';
  }
}

// Демонстрация использования разных типов операторов
void demonstrateOperators() {
  print('\n=== Демонстрация различных операторов ===');
  
  // Арифметические операторы
  int x = 10;
  int y = 3;
  print('Арифметические: $x + $y = ${x + y}');
  print('Арифметические: $x - $y = ${x - y}');
  print('Арифметические: $x * $y = ${x * y}');
  print('Арифметические: $x / $y = ${x / y}');
  print('Арифметические: $x % $y = ${x % y}');
  
  // Логические операторы
  bool isPositive = x > 0 && y > 0;
  bool isEven = x % 2 == 0 || y % 2 == 0;
  print('Логические (AND): x > 0 && y > 0 = $isPositive');
  print('Логические (OR): x четное или y четное = $isEven');
  
  // Тернарный оператор
  String result = x > y ? 'x больше y' : 'x меньше или равен y';
  print('Тернарный: $result');
  
  // Null-безопасность
  int? nullableInt;
  int nonNullableInt = nullableInt ?? 100;
  print('Null-безопасность (??): $nonNullableInt');
  
  // Каскадные операторы (для демонстрации)
  var numbers = [1, 2, 3, 4, 5]
    ..add(6)
    ..remove(1)
    ..sort();
  print('Каскадные операторы: $numbers');
}