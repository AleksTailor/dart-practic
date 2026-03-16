Future<void> countWithDelay() async {
  for (int i = 1; i <= 5; i++) {
    await Future.delayed(const Duration(seconds: 1));
    print(i);
  }
}

void main() async {
  print('Начинаем отсчёт:');
  await countWithDelay();
  print('Отсчёт завершён.');
}