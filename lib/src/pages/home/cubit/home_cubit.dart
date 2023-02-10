import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.reservamosRepository) : super(HomeState());

  final ReservamosRepository reservamosRepository;
  final fromController = TextEditingController();
  final toController = TextEditingController();

  Future<void> getPlaces() async {
    try {
      final places = await reservamosRepository.getPlaces();
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

  selectFrom({required PlaceModel place}) {
    emit(state.copyWith(
      from: place,
    ));
    fromController.value = TextEditingValue(
      text: '${state.from?.display}, ${state.from?.state}',
    );
  }

  unselectFrom({PlaceModel? place}) {
    state.copyWith(from: place);
    fromController.clear();
  }

  selectTo({required PlaceModel place}) {
    emit(state.copyWith(
      to: place,
    ));
    toController.value = TextEditingValue(
      text: '${state.to?.display}, ${state.to?.state}',
    );
  }

  unselectTo({PlaceModel? place}) {
    state.copyWith(from: place);
    toController.clear();
  }

  initSearch({required String query, required bool isFrom}) async {
    List<PlaceModel> places;

    emit(state.copyWith(searchStatus: SearchStatus.loading));

    if (isFrom) {
      if (state.to == null) {
        places = await reservamosRepository.getPlaces(query: query);
      } else {
        places = await reservamosRepository.getPlacesFrom(
          from: state.to!,
          query: query,
        );
      }
    } else {
      if (state.from == null) {
        places = await reservamosRepository.getPlaces(query: query);
      } else {
        places = await reservamosRepository.getPlacesTo(
          to: state.from!,
          query: query,
        );
      }
    }

    emit(state.copyWith(search: places, searchStatus: SearchStatus.sucess));
  }

  placeSelectSearch({required PlaceModel place, required bool isFrom}) {
    if (isFrom) {
      selectFrom(place: place);
    } else {
      selectTo(place: place);
    }
  }

  resetSearch() {
    emit(state.copyWith(
      searchStatus: SearchStatus.init,
      search: [],
    ));
  }
}
