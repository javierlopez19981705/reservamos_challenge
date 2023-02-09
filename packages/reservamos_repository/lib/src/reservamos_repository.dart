import 'package:reservamos_repository/src/models/place_model.dart';
import 'package:reservamos_service/reservamos_service.dart';
import 'package:weather_repository/weather_repository.dart';

/// {@template reservamos_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ReservamosRepository {
  ///
  ReservamosRepository({
    ReservamosService? reservamosService,
    WeatherRepository? weatherRepository,
  })  : _reservamosService = reservamosService ?? ReservamosService(),
        _weatherRepository = weatherRepository ?? WeatherRepository();

  /// {@macro reservamos_repository}

  final ReservamosService _reservamosService;
  final WeatherRepository _weatherRepository;

  ///
  Future<List<PlaceModel>> getPlaces({
    String? query,
  }) async {
    final data = await _reservamosService.fetchPlaces(q: query);

    try {
      final places = data
          .map(PlaceModel.fromJson)
          .where((element) => element.lat != null && element.long != null)
          .toList();

      return places;
    } catch (e) {
      throw Exception();
    }
  }

  ///
  Future<List<PlaceModel>> getPlacesFrom({
    required String query,
    required PlaceModel from,
  }) async {
    final data =
        await _reservamosService.fetchPlaces(q: query, from: from.slug);
    try {
      final places = data
          .map(PlaceModel.fromJson)
          .where((element) => element.lat != null && element.long != null)
          .toList();

      return places;
    } catch (e) {
      throw Exception();
    }
  }

  ///
  Future<List<PlaceModel>> getPlacesTo({
    required String query,
    required PlaceModel to,
    bool getWeather = false,
  }) async {
    final data = await _reservamosService.fetchPlaces(q: query, to: to.slug);
    try {
      return data
          .map(PlaceModel.fromJson)
          .where((element) => element.lat != null && element.long != null)
          .toList();
    } catch (e) {
      throw Exception();
    }
  }

  ///
  Future<void> getWeatherF({required PlaceModel place}) async {
    try {
      final weather = await _weatherRepository.getWeather(
        lat: place.lat!,
        lon: place.long!,
      );

      place.weather = weather;
    } catch (_) {
      throw Exception();
    }
  }
}
