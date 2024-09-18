import 'package:flutter/material.dart';
import 'package:nasa/src/data/model/planet.dart';
import 'package:nasa/src/presintations/widgets/planet_widgets.dart';

class SearchAppBar extends StatefulWidget implements PreferredSizeWidget {
  final List<Planet> planets;

  SearchAppBar({required this.planets});

  @override
  _SearchAppBarState createState() => _SearchAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(80.0);
}

class _SearchAppBarState extends State<SearchAppBar> {
  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                  setState(() {
                    searchQuery =
                        query; // Обновляем переменную searchQuery при изменении текста
                  });
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
                  planets: widget.planets,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
