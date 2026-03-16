import 'dart:math';

Future<Map<String, dynamic>> getWeather() async {
  final random = Random();
  final shouldThrowError = random.nextDouble() < 0.3; 

  if (shouldThrowError) {
    throw Exception('Не удалось получить данные о погоде: ошибка сети');
  }

  await Future.delayed(const Duration(seconds: 3));

  return {
    'city': 'Москва',
    'temperature': 22,
    'description': 'Ясно',
    'humidity': 60,
  };
}

void main() async {
  print('Запрашиваем данные о погоде...');

  try {
    final weatherData = await getWeather();
    print('Данные успешно получены:');
    print('Город: ${weatherData['city']}');
    print('Температура: ${weatherData['temperature']}°C');
    print('Описание: ${weatherData['description']}');
    print('Влажность: ${weatherData['humidity']}%');
  } on Exception catch (error) {
    print('Произошла ошибка при получении данных о погоде:');
    print(error.toString());
  } catch (unknownError) {
    print('Непредвиденная ошибка:');
    print(unknownError.toString());
  } finally {
    print('\n--- Завершение работы программы ---');
  }
}
