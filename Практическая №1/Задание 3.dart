void main() {
  String inputString = "Distraction"; // Принимаем строку
  String vowels = "aeiouyAEIOUY"; // Определяем строку с гласными буквами
  int vowelCount = 0; // Инициализируем счётчик гласных букв
  for (int i = 0; i < inputString.length; i++) { // Проходим по каждому символу строки
    String currentChar = inputString[i]; // Берём символ по индексу i
    if (vowels.contains(currentChar)) { // Проверяем, есть ли текущий символ в строке с гласными
      vowelCount++; // Если символ — гласная, увеличиваем счётчик на 1
    }
  }
  print('Слово: $inputString');
  print('Гласных букв: $vowelCount');
}
