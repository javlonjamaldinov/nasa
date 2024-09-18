import 'package:flutter/material.dart';
import 'dart:math';

import 'package:nasa/src/data/model/planet.dart';
import 'package:nasa/src/data/model/planets.dart';
import 'package:nasa/src/presintations/details/planet_details.dart';
import 'package:nasa/src/presintations/features/animated.dart';
import 'package:nasa/src/presintations/widgets/planet_widgets.dart';

void main() {
  runApp(const SpaceApp());
}

class SpaceApp extends StatelessWidget {
  const SpaceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String searchQuery = ''; // Переменная для хранения текста поиска
  List<Planet> filteredPlanets = [];

  @override
  void initState() {
    filteredPlanets = planets;
    super.initState();
  }

  void _searchPlanets(String query) {
    setState(() {
      filteredPlanets = planets
          .where((planet) =>
              planet.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80.0,
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: TextField(
                  style: const TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 14.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.blue.withOpacity(0.8), width: 2),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.grey.withOpacity(0.7), width: 1.5),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    hintText: 'Search...',
                    hintStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.grey.withOpacity(0.7),
                    ),
                  ),
                  onChanged: (query) {
                    searchQuery =
                        query; // Обновляем переменную searchQuery при изменении текста
                  },
                ),
              ),
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: PlanetSearch(
                    planets: planets,
                   
                       
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          const AnimatedBackground(), // Добавляем анимацию фона
          ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: filteredPlanets.length,
            itemBuilder: (context, index) {
              final planet = filteredPlanets[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          PlanetDetailPage(planet: planet),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) {
                        const begin = Offset(0.0, 1.0);
                        const end = Offset.zero;
                        const curve = Curves.easeInOut;

                        var tween = Tween(begin: begin, end: end)
                            .chain(CurveTween(curve: curve));

                        var offsetAnimation = animation.drive(tween);

                        return SlideTransition(
                          position: offsetAnimation,
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: _planetCard(context, planet),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _planetCard(BuildContext context, Planet planet) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.0)),
      elevation: 12,
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius:
                      const BorderRadius.vertical(top: Radius.circular(25.0)),
                  child: Hero(
                    tag: planet.name,
                    child: Image.asset(
                      planet.imagePath,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    planet.name,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Transform.rotate(
              angle: -pi / 14,
              child: Icon(
                Icons.star,
                color: Colors.yellow.shade700,
                size: 40,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
