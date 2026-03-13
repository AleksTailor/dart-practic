import 'dart:math';

class MathProcessor {
  final List<double> numbers;

  MathProcessor(this.numbers);

  /// Применяет функцию [func] к каждому элементу списка и возвращает новый список.
  List<double> process(double Function(double) func) {
    return numbers.map(func).toList();
  }

  /// Генерирует список случайных чисел заданной длины [count] в диапазоне от 0 до 100.
  static List<double> getRandomNumbers(int count) {
    final random = Random();
    return List.generate(count, (_) => random.nextDouble() * 100);
  }
}

void main() {
  // Пример использования
  final randomNumbers = MathProcessor.getRandomNumbers(5);
  print('Случайные числа: $randomNumbers');

  final processor = MathProcessor(randomNumbers);
  final squares = processor.process((x) => x * x);
  print('Квадраты: $squares');
}