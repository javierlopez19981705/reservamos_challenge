import 'package:bloc/bloc.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

part 'weather_places_state.dart';

class WeatherPlacesCubit extends Cubit<WeatherPlacesState> {
  WeatherPlacesCubit(this.from, this.to, this.reservamosRepository)
      : super(WeatherPlacesState(from: from, to: to));

  final PlaceModel from;
  final PlaceModel to;
  final ReservamosRepository reservamosRepository;

  searchWeather() {
    Future.wait([_getFromWeather(), _getToWeather()]).then((List responses) {
      emit(state.copyWith(
        status: WeatherPlacesStatus.success,
      ));
    }).catchError(
      (e) {
        emit(state.copyWith(
          status: WeatherPlacesStatus.error,
        ));
      },
    );
  }

  Future<void> _getFromWeather() async {
    await reservamosRepository.getWeatherF(place: state.from);
  }

  Future<void> _getToWeather() async {
    await reservamosRepository.getWeatherF(place: state.to);
  }
}
