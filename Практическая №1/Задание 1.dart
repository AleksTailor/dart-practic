void main() {
  String name = "Алексей";
  int age = 27;
  double averageGrade = 4.5;
  bool isStudent = true;

  print("Имя: $name ${name.runtimeType}");
  print("Возраст: $age ${age.runtimeType}");
  print("Средний балл: $averageGrade ${averageGrade.runtimeType}");
  print("Студент: ${isStudent ? "да" : "нет"} ${isStudent.runtimeType}");
}
