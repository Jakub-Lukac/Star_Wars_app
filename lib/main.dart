import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_wars_app/bloc/character_bloc/character_bloc.dart';
import 'package:star_wars_app/bloc/movies_bloc/movies_bloc.dart';
import 'package:star_wars_app/bloc/vehicles_bloc/vehicles_bloc.dart';
import 'package:star_wars_app/config/color_pallete.dart';
import 'package:star_wars_app/screens/home_screen.dart';
import 'package:star_wars_app/screens/login_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CharacterBloc()
            ..add(
              const LoadCharacters(),
            ),
        ),
        BlocProvider(
          create: (context) => MoviesBloc()
            ..add(
              const LoadMovies(),
            ),
        ),
        BlocProvider(
          create: (context) => VehiclesBloc()
            ..add(
              const LoadVehicles(),
            ),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: colorPallete.backgroundColor,
        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: colorPallete.textColor,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      routes: {
        "/login-screen": (context) => LoginScreen(),
        "/home-screen": (context) => const HomeScreen(),
      },
    );
  }
}
