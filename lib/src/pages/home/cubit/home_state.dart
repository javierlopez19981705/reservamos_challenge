part of 'home_cubit.dart';

class HomeState {
  HomeState({
    this.places = const [],
    this.search = const [],
    this.status = HomeStatus.loading,
    this.searchStatus = SearchStatus.loading,
    this.from,
    this.to,
  });
  final List<PlaceModel> places;
  final List<PlaceModel> search;
  final HomeStatus status;
  final SearchStatus searchStatus;
  final PlaceModel? from;
  final PlaceModel? to;

  HomeState copyWith({
    List<PlaceModel>? places,
    List<PlaceModel>? search,
    HomeStatus? status,
    SearchStatus? searchStatus,
    PlaceModel? from,
    PlaceModel? to,
  }) =>
      HomeState(
        places: places ?? this.places,
        search: search ?? this.search,
        status: status ?? this.status,
        searchStatus: searchStatus ?? this.searchStatus,
        from: from ?? this.from,
        to: to ?? this.to,
      );
}

enum HomeStatus {
  loading,
  sucess,
  error;
}

enum SearchStatus {
  init,
  loading,
  sucess,
  error;
}
