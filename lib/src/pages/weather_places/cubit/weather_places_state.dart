part of 'weather_places_cubit.dart';

class WeatherPlacesState {
  WeatherPlacesState({
    required this.from,
    required this.to,
    this.status = WeatherPlacesStatus.loading,
  });

  final PlaceModel from;
  final PlaceModel to;
  final WeatherPlacesStatus status;

  WeatherPlacesState copyWith({
    PlaceModel? from,
    PlaceModel? to,
    WeatherPlacesStatus? status,
  }) {
    return WeatherPlacesState(
      from: from ?? this.from,
      to: to ?? this.to,
      status: status ?? this.status,
    );
  }
}

enum WeatherPlacesStatus {
  loading,
  success,
  error;
}
