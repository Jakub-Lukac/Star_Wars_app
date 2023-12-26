import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/bloc/character_bloc/character_bloc.dart';
import 'package:star_wars_app/config/color_pallete.dart';
import 'package:star_wars_app/screens/detail_screens/character_detail_screen.dart';
import 'package:star_wars_app/widgets/skeleton.dart';

import '../widgets/item_card.dart';

class CharactersScreen extends StatelessWidget {
  const CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Characters",
          style: TextStyle(
            color: colorPallete.textColor,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: colorPallete.characterColor,
      ),
      body: BlocBuilder<CharacterBloc, CharacterState>(
        builder: (context, state) {
          if (state is CharacterLoading) {
            return ListView.builder(
              itemCount: 6,
              itemBuilder: (context, index) {
                return const Skeleton();
              },
            );
          }

          if (state is CharactersLoaded) {
            return ListView.builder(
              itemCount: state.characters.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return CharacterDetailScreen(
                            character: state.characters[index],
                          );
                        },
                      ),
                    );
                  },
                  child: ItemCard(
                    name: state.characters[index].name,
                    color: colorPallete.characterColor,
                  ),
                );
              },
            );
          }
          if (state is CharactersError) {
            return Center(
              child: Text(
                state.errorMessage,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: colorPallete.characterColor,
                ),
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
