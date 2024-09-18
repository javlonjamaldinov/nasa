 import 'package:nasa/src/data/model/planet.dart';

final List<Planet> planets = [
    Planet(
      name: 'Earth',
      imagePath: 'assets/icons/world.png',
      description: ' Earth is the third planet from the Sun and the only astronomical object known to harbor life',
     
      diameter: 4879,
      distanceFromSun: 57.9,
      moons: 0,
    ),
    Planet(
      name: 'Venus',
      imagePath: 'assets/icons/venus.png',
      description: 'Venus is the second planet from the Sun.',
      diameter: 12104,
      distanceFromSun: 108.2,
      moons: 0,
    ),
    Planet(
      name: 'Earth',
      imagePath: 'assets/icons/uranus.png',
      description:
          'Mercury is the smallest planet in the Solar System.',
      diameter: 12742,
      distanceFromSun: 149.6,
      moons: 1,
    ),
    Planet(
      name: 'Mars',
      imagePath: 'assets/icons/sun.png',
      description: 'Mars is the fourth planet from the Sun.',
      diameter: 6779,
      distanceFromSun: 227.9,
      moons: 2,
    ),
    Planet(
      name: 'Jupiter',
      imagePath: 'assets/icons/saturn.png',
      description: 'Jupiter is the largest planet in the Solar System.',
      diameter: 139820,
      distanceFromSun: 778.5,
      moons: 79,
    ),
    Planet(
      name: 'Saturn',
      imagePath: 'assets/icons/neptune.png',
      description: 'Saturn is known for its prominent ring system.',
      diameter: 116460,
      distanceFromSun: 1434,
      moons: 83,
    ),
    Planet(
      name: 'Uranus',
      imagePath: 'assets/icons/mercury.png',
      description: 'Uranus is the seventh planet from the Sun.',
      diameter: 50724,
      distanceFromSun: 2871,
      moons: 27,
    ),
    Planet(
      name: 'Neptune',
      imagePath: 'assets/icons/mars.png',
      description:
          'Neptune is the farthest planet from the Sun in the Solar System.',
      diameter: 49244,
      distanceFromSun: 4495,
      moons: 14,
    ),
     Planet(
      name: 'Neptune',
      imagePath: 'assets/icons/jupiter.png',
      description:
          'Neptune is the farthest planet from the Sun in the Solar System.',
      diameter: 49244,
      distanceFromSun: 4495,
      moons: 14,
    ),
  ];