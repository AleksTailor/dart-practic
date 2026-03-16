import 'dart:math';

Future<String> fetchUserData() async {
  await Future.delayed(const Duration(seconds: 1));

  if (Random().nextDouble() > 0.5) {
    throw Exception('Ошибка загрузки данных');
  }

  return 'Алексей Кузьмичев';
}

void main() async {
  try {
    String userName = await fetchUserData();
    print('Данные пользователя: $userName');
  } catch (e) {
    print('Ошибка: $e');
  }
}