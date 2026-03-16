void main() {
  // Создаём массив типа Student, содержащий объекты Student и Aspirant
  List<Student> students = [
    Student('Иван', 'Иванов', 'М-11', 4.7),
    Student('Анна', 'Петрова', 'М-11', 5.0),
    Aspirant('Алексей', 'Сидоров', 'А-23', 4.9, 'Исследование свойств полимеров'),
    Aspirant('Мария', 'Воробьёва', 'А-23', 5.0, 'Разработка алгоритмов машинного обучения'),
  ];

  // Вызываем метод getScholarship() для каждого элемента массива
  for (var student in students) {
    print('${student.firstName} ${student.lastName}: стипендия = ${student.getScholarship()} руб.');
  }
}

// Базовый класс Student
class Student {
  String firstName;
  String lastName;
  String group;
  double averageMark;

  Student(this.firstName, this.lastName, this.group, this.averageMark);

  double getScholarship() {
    return averageMark == 5.0 ? 2000.0 : 1900.0;
  }
}
class Aspirant extends Student {
  String scientificWork; // Научная работа аспиранта

  Aspirant(String firstName, String lastName, String group, double averageMark, this.scientificWork)
      : super(firstName, lastName, group, averageMark);


  @override
  double getScholarship() {
    return averageMark == 5.0 ? 2500.0 : 2200.0;
  }
}
