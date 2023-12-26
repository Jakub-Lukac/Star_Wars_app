import 'package:flutter/material.dart';
import 'package:star_wars_app/config/color_pallete.dart';
import 'package:star_wars_app/screens/add_screen.dart';
import 'package:star_wars_app/screens/characters_screen.dart';
import 'package:star_wars_app/screens/movies_screen.dart';
import 'package:star_wars_app/screens/vehicles_screen.dart';

class HomeScreen extends StatefulWidget {
  final int indexOfPage;
  const HomeScreen({super.key, this.indexOfPage = 0});

  static String routeName = "/home-screen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.indexOfPage;
  }

  void _changeScreen(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Color _itemColorSelected(int index) {
    Color color = Colors.white;
    switch (index) {
      case 0:
        color = colorPallete.characterColor;
        break;
      case 1:
        color = colorPallete.movieColor;
        break;
      case 2:
        color = colorPallete.vehiclesColor;
        break;
      case 3:
        color = colorPallete.addColor;
        break;
    }
    return color;
  }

  final _pages =  [
    const CharactersScreen(),
    const MoviesScreen(),
    const VehiclesScreen(),
    AddScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 2,
        backgroundColor: colorPallete.tabBarBackgroundColor,
        selectedItemColor: _itemColorSelected(_currentIndex),
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
        unselectedItemColor:
            colorPallete.textColorInactive, // only for label in this case
        iconSize: 30,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          _changeScreen(value);
        },
        items: [
          BottomNavigationBarItem(
            label: "Characters",
            activeIcon: const Icon(Icons.person),
            icon: Icon(
              Icons.person_outline,
              color: colorPallete.characterColorOpacity,
            ),
          ),
          BottomNavigationBarItem(
            label: "Movies",
            activeIcon: const Icon(Icons.movie),
            icon: Icon(
              Icons.movie_outlined,
              color: colorPallete.movieColorOpacity,
            ),
          ),
          BottomNavigationBarItem(
            label: "Vehicles",
            activeIcon: const Icon(Icons.rocket),
            icon: Icon(
              Icons.rocket_outlined,
              color: colorPallete.vehiclesColorOpacity,
            ),
          ),
          BottomNavigationBarItem(
            label: "Add",
            activeIcon: const Icon(Icons.add_circle),
            icon: Icon(
              Icons.add_circle_outline,
              color: colorPallete.addColorOpacity,
            ),
          ),
        ],
      ),
    );
  }
}
