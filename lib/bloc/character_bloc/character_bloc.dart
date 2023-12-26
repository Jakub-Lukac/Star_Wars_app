import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:star_wars_app/models/character.dart';

import 'package:star_wars_app/services/star_wars_service.dart';

part 'character_event.dart';
part 'character_state.dart';

class CharacterBloc extends Bloc<CharacterEvent, CharacterState> {
  CharacterBloc() : super(CharacterLoading()) {
    on<LoadCharacters>(_onLoadCharacters);
    on<AddCharacter>(_onAddCharacter);
  }

  void _onLoadCharacters(
      LoadCharacters event, Emitter<CharacterState> emit) async {
    try {
      final dio = Dio();
      final starWarsSerive = StarWarsService(dio);

      final Map<String, dynamic> response =
          await starWarsSerive.getCharacters();

      final List<Character> listOfCharacters = (response['results'] as List)
          .map((characterJson) => Character.fromJson(characterJson))
          .toList();

      emit(
        CharactersLoaded(characters: listOfCharacters),
      );
    } catch (e) {
      emit(
        const CharactersError("Failed to load characters..."),
      );
    }
  }

  void _onAddCharacter(AddCharacter event, Emitter<CharacterState> emit) {
    if (state is CharactersLoaded) {
      final state = this.state as CharactersLoaded;
      emit(
        CharactersLoaded(
          characters: List.from(state.characters)..add(event.character),
        ),
      );
    }
  }
}
