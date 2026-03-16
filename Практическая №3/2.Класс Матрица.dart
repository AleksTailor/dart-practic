class Matrix {
   late List<List<double>> data;
  late int rows;
  late int cols;
  
  Matrix(this.data) {
    rows = data.length;
    cols = data.isNotEmpty ? data[0].length : 0;
    if (data.isEmpty) {
      throw ArgumentError('Матрица не может быть пустой');}
       for (int i = 1; i < rows; i++) {
      if (data[i].length != cols) {
        throw ArgumentError('Все строки матрицы должны иметь одинаковое количество столбцов');
      }
    }
  }
  Matrix.zeros(int r, int c) {
    if (r <= 0 || c <= 0) {
      throw ArgumentError('Размеры матрицы должны быть положительными числами');
    }
    rows = r;
    cols = c;
    data = List.generate(rows, (_) => List.filled(cols, 0.0));
  }
  Matrix add(Matrix other) {
    if (rows != other.rows || cols != other.cols) {
      throw ArgumentError('Размеры матриц не совпадают: нельзя сложить');
    }
    List<List<double>> resultData = List.generate(rows, (i) {
      return List.generate(cols, (j) {
        return data[i][j] + other.data[i][j];
      });
    });
    return Matrix(resultData);
  }
  Matrix multiplyByScalar(double scalar) {
    List<List<double>> resultData = List.generate(rows, (i) {
      return List.generate(cols, (j) {
        return data[i][j] * scalar;
      });
    });
    return Matrix(resultData);
  }
  Matrix multiply(Matrix other) {
    if (cols != other.rows) {
      throw ArgumentError('Число столбцов первой матрицы должно равняться числу строк второй');
    }
    List<List<double>> resultData = List.generate(rows, (i) {
      return List.generate(other.cols, (j) {
        double sum = 0.0;
        for (int k = 0; k < cols; k++) {
          sum += data[i][k] * other.data[k][j];
        }
        return sum;
      });
    });
    return Matrix(resultData);
  }
  void printMatrix() {
    for (int i = 0; i < rows; i++) {
      String rowStr = data[i].map((e) => e.toStringAsFixed(2)).join(' ');
      print(rowStr);
    }
  }
}

void main() {
  try {
    Matrix a = Matrix([
      [1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0],
    ]);
    print('Матрица A:');
    a.printMatrix();
    print('');
    Matrix b = Matrix([
      [7.0, 8.0, 9.0],
      [10.0, 11.0, 12.0],
    ]);
    print('Матрица B:');
    b.printMatrix();
       Matrix c = a.add(b);
    print('A + B =');
    c.printMatrix();
    print('');
    Matrix d = a.multiplyByScalar(2.5);
    print('A * 2.5 =');
    d.printMatrix();
    print('');
    Matrix e = Matrix([
      [1.0, 2.0],
      [3.0, 4.0],
      [5.0, 6.0],
    ]);
    print('Матрица E:');
    e.printMatrix();
    print('');
    Matrix f = a.multiply(e);
    print('A * E =');
    f.printMatrix();
    print('');
    Matrix g = Matrix.zeros(3, 3);
    print('Матрица G (3x3):');
    g.printMatrix();
    print('');
    print('Попытка сложения A (2x3) и G (3x3):');
    try {
      Matrix h = a.add(g);
    } catch (e) {
      print('Ошибка: $e');
    }
  } catch (e) {
    print('Ошибка при создании матрицы: $e');
  }
}