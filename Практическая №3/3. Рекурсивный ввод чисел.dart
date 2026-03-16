void main() {
  print("Пример 1: A = 1, B = 5");
  printRange(1, 5);
  print("");

  print("Пример 2: A = 10, B = 3");
  printRange(10, 3);
  print("");

  print("Пример 3: A = -3, B = 2");
  printRange(-3, 2);
  print("");

  print("Пример 4: A = 5, B = 5");
  printRange(5, 5);
}

void printRange(int a, int b) {
  print(a);
  if (a == b) return;
  if (a < b) {
    printRange(a + 1, b);
  } else {
    printRange(a - 1, b);
  }
}
