import 'package:reservamos_repository/src/models/place_model.dart';
import 'package:reservamos_service/reservamos_service.dart';

/// {@template reservamos_repository}
/// A Very Good Project created by Very Good CLI.
/// {@endtemplate}
class ReservamosRepository {
  ///
  ReservamosRepository({
    ReservamosService? reservamosService,
  }) : _reservamosService = reservamosService ?? ReservamosService();

  /// {@macro reservamos_repository}

  final ReservamosService _reservamosService;

  ///
  Future<List<PlaceModel>> getPlaces() async {
    final data = await _reservamosService.fetchPlaces();

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
  Future<List<PlaceModel>> getPlacesFrom({
    required String query,
    required PlaceModel from,
  }) async {
    final data =
        await _reservamosService.fetchPlaces(q: query, from: from.slug);
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
  Future<List<PlaceModel>> getPlacesTo({
    required String query,
    required PlaceModel to,
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
}
