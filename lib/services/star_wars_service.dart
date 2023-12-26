import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';

part 'star_wars_service.g.dart';

@RestApi(baseUrl: "https://swapi.dev/api")
abstract class StarWarsService {
  factory StarWarsService(Dio dio, {String baseUrl}) = _StarWarsService;

  @GET("/people")
  Future<Map<String, dynamic>> getCharacters();

  @GET("/films")
  Future<Map<String,dynamic>> getMovies();

  @GET("/vehicles")
  Future<Map<String,dynamic>> getVehicles();
}
