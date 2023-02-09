part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.places = const [],
    this.status = HomeStatus.loading,
  });
  final List<PlaceModel> places;
  final HomeStatus status;

  HomeState copyWith({
    List<PlaceModel>? places,
    HomeStatus? status,
  }) =>
      HomeState(
        places: places ?? this.places,
        status: status ?? this.status,
      );
}

enum HomeStatus {
  loading,
  sucess,
  error;
}
