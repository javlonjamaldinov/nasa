import 'package:flutter/material.dart';
import 'package:nasa/src/data/model/planet.dart';
import 'package:nasa/src/presintations/details/planet_details.dart';

class PlanetSearch extends SearchDelegate<String> {
  final List<Planet> planets;

  PlanetSearch({required this.planets});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final results = planets
        .where((planet) => planet.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (context, index) {
        final planet = results[index];
        return ListTile(
          title: Text(planet.name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlanetDetailPage(planet: planet),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = planets
        .where((planet) => planet.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        final planet = suggestions[index];
        return ListTile(
          title: Text(planet.name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PlanetDetailPage(planet: planet),
              ),
            );
          },
        );
      },
    );
  }
}
