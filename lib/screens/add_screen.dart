import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/bloc/character_bloc/character_bloc.dart';
import 'package:star_wars_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:star_wars_app/bloc/vehicles_bloc/vehicles_bloc.dart';
import 'package:star_wars_app/config/color_pallete.dart';
import 'package:star_wars_app/models/character.dart';
import 'package:star_wars_app/models/movie.dart';
import 'package:star_wars_app/models/vehicle.dart';

import 'package:star_wars_app/screens/home_screen.dart';

// ignore: must_be_immutable
class AddScreen extends StatelessWidget {
  AddScreen({super.key});

  final _formCharacter = GlobalKey<FormState>();
  final TextEditingController _enteredCharacterNameController =
      TextEditingController();
  final TextEditingController _enteredCharacterHeightController =
      TextEditingController();

  final _formMovie = GlobalKey<FormState>();
  final TextEditingController _enteredMovieTitleController =
      TextEditingController();
  final TextEditingController _enteredMovieEpisodeIdController =
      TextEditingController();

  final _formVehicle = GlobalKey<FormState>();
  final TextEditingController _enteredVehicleNameController =
      TextEditingController();
  final TextEditingController _enteredVehicleCostInCreditsController =
      TextEditingController();

  bool _isTextFieldEnabled = true;

  void _submitCharacter(BuildContext context) {
    if (_formCharacter.currentState!.validate()) {
      _formCharacter.currentState!.save();
      context.read<CharacterBloc>().add(
            AddCharacter(
              Character(
                name: _enteredCharacterNameController.text,
                height: _enteredCharacterHeightController.text,
              ),
            ),
          );
      // pushReplacement so users does not get the option to go back
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen(
              indexOfPage: 0,
            );
          },
        ),
      );
    }
  }

  void _submitMovie(BuildContext context) {
    if (_formMovie.currentState!.validate()) {
      _formMovie.currentState!.save();
      context.read<MoviesBloc>().add(
            AddMovie(
              Movie(
                title: _enteredMovieTitleController.text,
                episodeId: int.parse(_enteredMovieEpisodeIdController.text),
              ),
            ),
          );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen(
              indexOfPage: 1,
            );
          },
        ),
      );
    }
  }

  void _submitVehicle(BuildContext context) {
    if (_formVehicle.currentState!.validate()) {
      _formVehicle.currentState!.save();
      context.read<VehiclesBloc>().add(
            AddVehicle(
              Vehicle(
                name: _enteredVehicleNameController.text,
                costInCredits:
                    double.parse(_enteredVehicleCostInCreditsController.text),
              ),
            ),
          );
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const HomeScreen(
              indexOfPage: 2,
            );
          },
        ),
      );
    }
  }

  String? _characterNameValidator(String? value) {
    if (value == null || value.trim().isEmpty || value.trim().length < 6) {
      return "Invalid character name";
    }
    return null;
  }

  String? _characterHeightValidator(String? value) {
    if (value == null || value.trim().isEmpty || double.tryParse(value)! <= 0) {
      return "Invalid character height";
    }
    return null;
  }

  String? _movieTitleValidator(String? value) {
    if (value == null || value.trim().isEmpty || value.trim().length < 6) {
      return "Invalid movie name";
    }
    return null;
  }

  String? _movieEpisodeIdValidator(String? value) {
    if (value == null || value.trim().isEmpty || double.tryParse(value)! <= 0) {
      return "Invalid movie ID";
    }
    return null;
  }

  String? _vehicleNameValidator(String? value) {
    if (value == null || value.trim().isEmpty || value.trim().length < 6) {
      return "Invalid vehicle name";
    }
    return null;
  }

  String? _vehicleCostValidator(String? value) {
    if (value == null || value.trim().isEmpty || double.tryParse(value)! <= 0) {
      return "Invalid vehicle cost";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorPallete.tabBarBackgroundColor,
        title: Text(
          "Add",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: colorPallete.textColor,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              BlocBuilder<CharacterBloc, CharacterState>(
                builder: (context, state) {
                  if (state is CharactersError) {
                    _isTextFieldEnabled = !_isTextFieldEnabled;
                  }
                  return _inputComponent(
                    context,
                    "ADD CHARACTERS",
                    colorPallete.characterColor,
                    _formCharacter,
                    _isTextFieldEnabled,
                    colorPallete.characterColorOpacity,
                    TextInputType.name,
                    "Name",
                    _enteredCharacterNameController,
                    _characterNameValidator,
                    TextInputType.number,
                    "Height",
                    _enteredCharacterHeightController,
                    _characterHeightValidator,
                    _submitCharacter,
                  );
                },
              ),
              BlocBuilder<MoviesBloc, MoviesState>(
                builder: (context, state) {
                  if (state is MovieError) {
                    _isTextFieldEnabled = !_isTextFieldEnabled;
                  }
                  return _inputComponent(
                    context,
                    "ADD MOVIE",
                    colorPallete.movieColor,
                    _formMovie,
                    _isTextFieldEnabled,
                    colorPallete.movieColorOpacity,
                    TextInputType.name,
                    "Title",
                    _enteredMovieTitleController,
                    _movieTitleValidator,
                    TextInputType.number,
                    "Episode ID",
                    _enteredMovieEpisodeIdController,
                    _movieEpisodeIdValidator,
                    _submitMovie,
                  );
                },
              ),
              BlocBuilder<VehiclesBloc, VehiclesState>(
                builder: (context, state) {
                  if (state is VehiclesError) {
                    _isTextFieldEnabled = !_isTextFieldEnabled;
                  }
                  return _inputComponent(
                    context,
                    "ADD VEHICLE",
                    colorPallete.vehiclesColor,
                    _formVehicle,
                    _isTextFieldEnabled,
                    colorPallete.vehiclesColorOpacity,
                    TextInputType.name,
                    "Name",
                    _enteredVehicleNameController,
                    _vehicleNameValidator,
                    TextInputType.number,
                    "Cost in Credits",
                    _enteredVehicleCostInCreditsController,
                    _vehicleCostValidator,
                    _submitVehicle,
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding _inputComponent(
    BuildContext context,
    String title,
    Color backgroundColor,
    GlobalKey<FormState> key,
    bool isTextFieldEnabled,
    Color colorOpacity,
    TextInputType firstKeyboardType,
    String firstHintText,
    TextEditingController firstEditingController,
    String? Function(String?) firstValidatorMethod,
    TextInputType secondKeyBoardType,
    String secondHintText,
    TextEditingController secondEditingController,
    String? Function(String?) secondValidatorMethod,
    void Function(BuildContext context)? onPressed,
  ) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: backgroundColor,
              letterSpacing: 7,
            ),
          ),
          Form(
            key: key,
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    color: colorOpacity,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: backgroundColor, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      enabled: isTextFieldEnabled,
                      controller: firstEditingController,
                      keyboardType: firstKeyboardType,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: firstHintText,
                        hintStyle: TextStyle(
                          color: colorPallete.textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: (value) {
                        return firstValidatorMethod(value);
                      },
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                    color: colorOpacity,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: backgroundColor, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextFormField(
                      enabled: isTextFieldEnabled,
                      controller: secondEditingController,
                      keyboardType: secondKeyBoardType,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: secondHintText,
                        hintStyle: TextStyle(
                          color: colorPallete.textColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      validator: (value) {
                        secondValidatorMethod(value);
                        return null;
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25,
                  ),
                  child: ElevatedButton(
                    onPressed: _isTextFieldEnabled ? () => onPressed?.call(context) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: backgroundColor,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 10,
                      ),
                    ),
                    child: Text(
                      "ADD",
                      style: TextStyle(
                        color: colorPallete.textColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
