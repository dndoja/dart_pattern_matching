import '../pattern_matching.dart';

abstract class CarPart with PatternMatchable<CarPartType> {}

enum CarPartType<T extends CarPart> with TypeConverter<T> {
  engine<Engine>(),
  transmission<Transmission>();
}

class Engine implements CarPart {
  const Engine({
    required this.cylinders,
    required this.horsepower,
  });
  final int cylinders;
  final int horsepower;

  CarPartType get entityType => CarPartType.engine;
}

class Transmission implements CarPart {
  const Transmission({
    required this.gears,
    required this.isManual,
  });
  final int gears;
  final bool isManual;

  CarPartType get entityType => CarPartType.transmission;
}
