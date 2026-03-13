import 'dart:math';

// Интерфейс для боевых действий
abstract interface class ICombatant {
  double attack();
  void defend(double damage);
}

// Абстрактный базовый класс персонажа
abstract class Character implements ICombatant {
  String name;
  double health;
  int level;

  Character(this.name, {this.level = 1}) : health = 100;

  bool isAlive() => health > 0;

  // Абстрактные методы (уже объявлены в интерфейсе)
  double attack();
  void defend(double damage);
}

// Воин
class Warrior extends Character {
  Warrior(String name, {int level = 1}) : super(name, level: level);

  @override
  double attack() {
    return 15 + level * 2;
  }

  @override
  void defend(double damage) {
    health -= damage * 0.8; // уменьшение урона на 20%
  }
}

// Маг
class Mage extends Character {
  Mage(String name, {int level = 1}) : super(name, level: level);

  @override
  double attack() {
    double dmg = 10 + level * 3;
    health += 5; // лечение после атаки
    return dmg;
  }

  @override
  void defend(double damage) {
    health -= damage; // получает полный урон
  }
}

// Разбойник
class Rogue extends Character {
  final Random _random = Random();

  Rogue(String name, {int level = 1}) : super(name, level: level);

  @override
  double attack() {
    double baseDamage = 10 + level * 2; // базовый урон (предположение)
    if (_random.nextDouble() < 0.2) {
      return baseDamage * 3; // критический удар
    }
    return baseDamage;
  }

  @override
  void defend(double damage) {
    if (_random.nextDouble() < 0.5) {
      // уворот — урон не получает
      return;
    }
    health -= damage;
  }
}

// Функция для проведения боя
void fight(Character a, Character b) {
  print('Бой между ${a.name} (уровень ${a.level}) и ${b.name} (уровень ${b.level})!');
  int round = 1;

  while (a.isAlive() && b.isAlive()) {
    print('\nРаунд $round:');

    // A атакует B
    double damageA = a.attack();
    print('${a.name} атакует ${b.name} и наносит урон ${damageA.toStringAsFixed(2)}');
    b.defend(damageA);
    print('${b.name} здоровье: ${b.health.toStringAsFixed(2)}');
    if (!b.isAlive()) {
      print('${b.name} пал! Победитель ${a.name}');
      break;
    }

    // B атакует A
    double damageB = b.attack();
    print('${b.name} атакует ${a.name} и наносит урон ${damageB.toStringAsFixed(2)}');
    a.defend(damageB);
    print('${a.name} здоровье: ${a.health.toStringAsFixed(2)}');
    if (!a.isAlive()) {
      print('${a.name} пал! Победитель ${b.name}');
      break;
    }

    round++;
  }
}

void main() {
  // Создаём персонажей
  Warrior warrior = Warrior('Арагорн', level: 5);
  Mage mage = Mage('Гэндальф', level: 5);
  Rogue rogue = Rogue('Леголас', level: 5);

  // Проводим тестовый бой
  fight(warrior, mage);
  print('-------------------');
  fight(rogue, warrior);
}