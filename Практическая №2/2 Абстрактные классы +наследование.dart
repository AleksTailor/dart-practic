import 'dart:math';

abstract class Shape {
  double area();
  static Shape fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    switch (type) {
      case 'circle':
        return Circle(radius: (json['radius'] as num).toDouble());
      case 'rectangle':
        return Rectangle(
          width: (json['width'] as num).toDouble(),
          height: (json['height'] as num).toDouble(),
        );
      default:
        throw ArgumentError('Unknown shape type: $type');
    }
  }
}

class Circle extends Shape {
  final double radius;

  Circle({required this.radius});

  @override
  double area() => pi * radius * radius;
}

class Rectangle extends Shape {
  final double width;
  final double height;

  Rectangle({required this.width, required this.height});

  @override
  double area() => width * height;
}

void main() {
  final circleJson = {'type': 'circle', 'radius': 5};
  final rectangleJson = {'type': 'rectangle', 'width': 4, 'height': 6};

  final circle = Shape.fromJson(circleJson);
  final rectangle = Shape.fromJson(rectangleJson);

  print('Площадь круга: ${circle.area()}');
  print('Площадь прямоугольника: ${rectangle.area()}');
}