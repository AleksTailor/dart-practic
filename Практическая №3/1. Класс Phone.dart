class Phone {
  String number;
  String model;
  double weight;
  Phone(this.number, this.model, this.weight);
  Phone.withTwoParams(this.number, this.model) : weight = 198.0;
  Phone.empty()
      : number = '',
        model = '',
        weight = 0.0;

  factory Phone.withThreeParams(String number, String model, double weight) {
    return Phone.withTwoParams(number, model)..weight = weight;
  }
  void receiveCall(String name) {
    print('Звонит $name');
  }
  String getNumber() {
    return number;
  }
  void sendMessage(List<String> phoneNumbers) {
    print('Сообщение будет отправлено на следующие номера:');
    for (final number in phoneNumbers) {
      print(number);
    }
  }
}

void main() {
  final phone1 = Phone('+7 (999) 123-45-67', 'iPhone 15', 171.0);
  final phone2 = Phone.withTwoParams('+7 (999) 765-43-21', 'Samsung Galaxy S24');
  final phone3 = Phone.empty()
    ..number = '+7 (999) 555-12-34'
    ..model = 'Google Pixel 8'
    ..weight = 183.0;
  print('Телефон 1:');
  print('Номер: ${phone1.number}');
  print('Модель: ${phone1.model}');
  print('Вес: ${phone1.weight} г');
  print('');

  print('Телефон 2:');
  print('Номер: ${phone2.number}');
  print('Модель: ${phone2.model}');
  print('Вес: ${phone2.weight} г');
  print('');

  print('Телефон 3:');
  print('Номер: ${phone3.number}');
  print('Модель: ${phone3.model}');
  print('Вес: ${phone3.weight} г');
  print('');

  phone1.receiveCall('Анна');
  print('Номер телефона: ${phone1.getNumber()}');
  print('');

  phone2.receiveCall('Борис');
  print('Номер телефона: ${phone2.getNumber()}');
  print('');

  phone3.receiveCall('Виктория');
  print('Номер телефона: ${phone3.getNumber()}');
  print('');

  phone1.sendMessage([
    '+7 (999) 987-65-43',
    '+7 (999) 876-54-32',
    '+7 (999) 765-43-21'
  ]);
  print('');

  phone2.sendMessage([
    '+7 (999) 654-32-10',
    '+7 (999) 543-21-09'
  ]);
  print('');

  phone3.sendMessage([
    '+7 (999) 432-10-98',
    '+7 (999) 321-09-87',
    '+7 (999) 210-98-76',
    '+7 (999) 109-87-65'
  ]);
}
