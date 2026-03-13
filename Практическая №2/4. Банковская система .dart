import 'dart:math';

class BankAccount {
  final int _accountNumber;
  double _balance;
  final String _ownerName;

  int get accountNumber => _accountNumber;
  double get balance => _balance;
  String get ownerName => _ownerName;

  BankAccount(this._ownerName)
      : _balance = 0.0,
        _accountNumber = _generateAccountNumber();

  // Безопасная генерация 10-значного номера (без использования nextInt с большими числами)
  static int _generateAccountNumber() {
    final random = Random();
    // Первая цифра от 1 до 9 (чтобы число гарантированно было 10-значным)
    int number = random.nextInt(9) + 1; // 1..9
    // Добавляем ещё 9 цифр (0..9) путём умножения на 10 и прибавления новой цифры
    for (int i = 1; i < 10; i++) {
      number = number * 10 + random.nextInt(10);
    }
    return number;
  }

  bool deposit(double amount) {
    if (amount <= 0) {
      print('Ошибка: сумма пополнения должна быть положительной.');
      return false;
    }
    _balance += amount;
    print('Счет $_accountNumber пополнен на $amount. Текущий баланс: $_balance');
    return true;
  }

  bool withdraw(double amount) {
    if (amount <= 0) {
      print('Ошибка: сумма снятия должна быть положительной.');
      return false;
    }
    if (amount > _balance) {
      print('Ошибка: недостаточно средств на счете $_accountNumber. Баланс: $_balance, запрошено: $amount');
      return false;
    }
    _balance -= amount;
    print('Со счета $_accountNumber снято $amount. Текущий баланс: $_balance');
    return true;
  }

  void displayBalance() {
    print('Счет $_accountNumber (владелец: $_ownerName): баланс = $_balance');
  }
}

class Bank {
  final List<BankAccount> _accounts = [];

  int addAccount(String ownerName) {
    BankAccount newAccount;
    // Гарантируем уникальность номера счёта
    do {
      newAccount = BankAccount(ownerName);
    } while (_findAccountByNumber(newAccount.accountNumber) != null);
    _accounts.add(newAccount);
    print('Создан новый счет: номер ${newAccount.accountNumber}, владелец $ownerName');
    return newAccount.accountNumber;
  }

  BankAccount? findAccount(int accountNumber) {
    return _findAccountByNumber(accountNumber);
  }

  BankAccount? _findAccountByNumber(int accountNumber) {
    try {
      return _accounts.firstWhere((acc) => acc.accountNumber == accountNumber);
    } on StateError {
      return null;
    }
  }

  void transfer(int fromAccountNumber, int toAccountNumber, double amount) {
    if (amount <= 0) {
      print('Ошибка: сумма перевода должна быть положительной.');
      return;
    }

    final fromAcc = findAccount(fromAccountNumber);
    final toAcc = findAccount(toAccountNumber);

    if (fromAcc == null) {
      print('Ошибка: счет отправителя $fromAccountNumber не найден.');
      return;
    }
    if (toAcc == null) {
      print('Ошибка: счет получателя $toAccountNumber не найден.');
      return;
    }

    if (fromAcc.withdraw(amount)) {
      toAcc.deposit(amount);
      print('Перевод $amount со счета $fromAccountNumber на счет $toAccountNumber выполнен успешно.');
    } else {
      print('Перевод не выполнен из-за ошибки при снятии со счета отправителя.');
    }
  }
}

void main() {
  final bank = Bank();

  int acc1 = bank.addAccount('Иван Иванов');
  int acc2 = bank.addAccount('Петр Петров');
  int acc3 = bank.addAccount('Сидор Сидоров');

  print('\n--- Пополнение счета 1 ---');
  bank.findAccount(acc1)?.deposit(1000);

  print('\n--- Попытка снятия со счета 2 (недостаточно средств) ---');
  bank.findAccount(acc2)?.withdraw(500);

  print('\n--- Перевод 300 со счета 1 на счет 3 ---');
  bank.transfer(acc1, acc3, 300);

  print('\n--- Итоговые балансы ---');
  bank.findAccount(acc1)?.displayBalance();
  bank.findAccount(acc2)?.displayBalance();
  bank.findAccount(acc3)?.displayBalance();
}