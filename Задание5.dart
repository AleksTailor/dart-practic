void main() {
  try {
    final matrix1 = Matrix.fromList([
      [1, 2, 3],
      [4, 5, 6],
    ]);

    final matrix2 = Matrix.fromList([
      [7, 8, 9],
      [10, 11, 12],
    ]);

    print('Матрица 1: $matrix1');
    print('Матрица 2: $matrix2');

    // Сложение
    final sum = matrix1.add(matrix2);
    print('Сложение: $sum');

    // Вычитание
    final difference = matrix1.subtract(matrix2);
    print('Вычитание: $difference');

    // Умножение на число
    final multipliedByScalar = matrix1.multiplyByScalar(2);
    print('Умножение на 2: $multipliedByScalar');

    // Транспонирование
    final transposed = matrix1.transpose();
    print('Транспонирование: $transposed');

    // Квадратная матрица для определителя и умножения матриц
    final squareMatrix1 = Matrix.fromList([
      [2, 1],
      [3, 4],
    ]);

    final squareMatrix2 = Matrix.fromList([
      [1, 0],
      [2, 3],
    ]);

    print('Квадратная матрица 1: $squareMatrix1');
    print('Квадратная матрица 2: $squareMatrix2');

    // Умножение матриц
    final matrixProduct = squareMatrix1.multiplyByMatrix(squareMatrix2);
    print('Умножение матриц: $matrixProduct');

    // Определитель
    print('Определитель квадратной матрицы 1: ${squareMatrix1.determinant()}');
  } catch (e) {
    print('Ошибка: $e');
  }
}

class Matrix {
  final List<List<double>> _data;
  final int rows;
  final int cols;

  Matrix.fromList(List<List<double>> data)
      : _data = data,
        rows = data.length,
        cols = data.isNotEmpty ? data[0].length : 0 {
    if (rows == 0 || cols == 0) {
      throw ArgumentError('Матрица не может быть пустой');
    }
    _validateDimensions();
  }

  void _validateDimensions() {
    for (final row in _data) {
      if (row.length != cols) {
        throw ArgumentError('Все строки матрицы должны иметь одинаковую длину');
      }
    }
  }

  List<List<double>> get data => _data.map((row) => row.toList()).toList();

  Matrix add(Matrix other) {
    _checkDimensionsMatch(other);
    final result = List.generate(rows, (_) => List.filled(cols, 0.0));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result[i][j] = _data[i][j] + other._data[i][j];
      }
    }
    return Matrix.fromList(result);
  }

  Matrix subtract(Matrix other) {
    _checkDimensionsMatch(other);
    final result = List.generate(rows, (_) => List.filled(cols, 0.0));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result[i][j] = _data[i][j] - other._data[i][j];
      }
    }
    return Matrix.fromList(result);
  }

  void _checkDimensionsMatch(Matrix other) {
    if (rows != other.rows || cols != other.cols) {
      throw StateError('Размеры матриц должны совпадать для сложения/вычитания');
    }
  }

  Matrix multiplyByScalar(double scalar) {
    final result = List.generate(rows, (_) => List.filled(cols, 0.0));
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result[i][j] = _data[i][j] * scalar;
      }
    }
    return Matrix.fromList(result);
  }

  Matrix multiplyByMatrix(Matrix other) {
    if (cols != other.rows) {
      throw StateError(
          'Количество столбцов первой матрицы должно равняться количеству строк второй матрицы');
    }

    final result =
        List.generate(rows, (_) => List.filled(other.cols, 0.0));

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < other.cols; j++) {
        for (int k = 0; k < cols; k++) {
          result[i][j] += _data[i][k] * other._data[k][j];
        }
      }
    }
    return Matrix.fromList(result);
  }

  Matrix transpose() {
    final result = List.generate(cols, (_) => List.filled(rows, 0.0));
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        result[j][i] = _data[i][j];
      }
    }
    return Matrix.fromList(result);
  }

  double determinant() {
    if (rows != cols) {
      throw StateError('Определитель можно вычислить только для квадратных матриц');
    }
    if (rows == 1) return _data[0][0];
    if (rows == 2) {
      return _data[0][0] * _data[1][1] - _data[0][1] * _data[1][0];
    }

    double det = 0;
    for (int col = 0; col < cols; col++) {
      det += _data[0][col] * _cofactor(0, col);
    }
    return det;
  }

  double _cofactor(int row, int col) {
    final sign = ((row + col) % 2 == 0) ? 1 : -1;
    return sign * _minor(row, col).determinant();
  }

  Matrix _minor(int rowToRemove, int colToRemove) {
    final minorData = <List<double>>[];
    for (int i = 0; i < rows; i++) {
      if (i == rowToRemove) continue;
      final newRow = <double>[];
      for (int j = 0; j < cols; j++) {
        if (j == colToRemove) continue;
        newRow.add(_data[i][j]);
      }
      minorData.add(newRow);
    }
    return Matrix.fromList(minorData);
  }
}