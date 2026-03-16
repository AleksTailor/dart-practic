import 'dart:math';

Future<String> fetchUserOrder() async {

  await Future.delayed(const Duration(seconds: 1));

  if (Random().nextBool()) {
    return 'Пуддинг';
  } else {
    return '';
  }
}

Future<void> processOrder(String order) async {
  await Future.delayed(const Duration(milliseconds: 500));

  if (order.isEmpty) {
    throw Exception('Заказ пустой!');
  }

  print('Обработка заказа: $order');
}

void main() async {
  print('Запрашиваем заказ...');

  try {
    String order = await fetchUserOrder();
    await processOrder(order);
    print('Заказ успешно обработан.');
  } catch (e) {
    print('Ошибка: $e');
  }
}