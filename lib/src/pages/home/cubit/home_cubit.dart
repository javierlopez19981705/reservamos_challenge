import 'package:bloc/bloc.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.reservamosRepository) : super(HomeState());

  final ReservamosRepository reservamosRepository;

  Future<void> getPlaces() async {
    try {
      final places = await reservamosRepository.getPlaces(getWeather: true);
      emit(state.copyWith(
        places: places,
        status: HomeStatus.sucess,
      ));
    } catch (_) {
      emit(state.copyWith(
        status: HomeStatus.error,
      ));
    }
  }
}
