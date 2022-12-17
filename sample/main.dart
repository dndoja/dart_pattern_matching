import 'car_parts.dart';

class Car {
  const Car(
    this.model, {
    required this.parts,
  });
  final String model;
  final List<CarPart> parts;

  String get description => [
        'These are the parts in a ${model}:',
        for (final part in parts) '- ${_getDescriptionForCarPart(part)}',
        '- And a whole bunch of other parts which I was too lazy to mention.',
      ].join('\n');
}

String _getDescriptionForCarPart(CarPart part) {
  switch (part.type) {
    case CarPartType.engine:
      final Engine engine = CarPartType.engine << part;

      return 'A ${engine.cylinders} cylinder engine '
          'which makes ${engine.horsepower}hp.';
    case CarPartType.transmission:
      return CarPartType.transmission.using(part).call(
        (transmission) => 'A ${transmission.gears} speed '
            '${transmission.isManual ? 'manual' : 'automatic'} transmission.',
      );
  }
}

void main(List<String> args) => print(
      const Car(
        'Nissan Skyline GT-R',
        parts: [
          Engine(
            cylinders: 6,
            horsepower: 300,
          ),
          Transmission(
            gears: 6,
            isManual: true,
          ),
        ],
      ).description,
    );
