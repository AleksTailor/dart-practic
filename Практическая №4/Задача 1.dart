Future<String> loadUserData() async {
  await Future.delayed(const Duration(seconds: 2));
  return 'Алексей Кузьмичев';
}

void main() async {
  print('Загрузка данных пользователя...');
  try {
    String userName = await loadUserData();
    print('Привет, $userName!');
  } catch (e) {
    print('Ошибка при загрузке данных: $e');
  }
}