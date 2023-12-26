import 'package:flutter/material.dart';
import 'package:star_wars_app/config/color_pallete.dart';

class ItemCard extends StatelessWidget {
  final String? name;
  final Color? color;

  const ItemCard({super.key, required this.name, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 30, bottom: 15),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: color,
      ),
      width: double.infinity,
      child: Center(
        child: Text(
          name!,
          style: TextStyle(
            color: colorPallete.textColor,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
