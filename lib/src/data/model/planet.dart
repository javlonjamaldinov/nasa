class Planet {
  final String name;
  final String imagePath;
  final String description;
  final double diameter;
  final double distanceFromSun;
  final int moons;

  Planet({
    required this.name,
    required this.imagePath,
    required this.description,
    required this.diameter,
    required this.distanceFromSun,
    required this.moons,
  });
}