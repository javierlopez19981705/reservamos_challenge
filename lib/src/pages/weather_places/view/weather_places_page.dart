import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos_challenge/src/pages/weather_places/cubit/weather_places_cubit.dart';
import 'package:reservamos_challenge/src/pages/weather_places/view/widgets/weather_places_list.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

class WeatherPlacesPage extends StatelessWidget {
  const WeatherPlacesPage({
    super.key,
    required this.from,
    required this.to,
  });

  final PlaceModel from;
  final PlaceModel to;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WeatherPlacesCubit>(
      create: (context) => WeatherPlacesCubit(
        from,
        to,
        context.read<ReservamosRepository>(),
      )..searchWeather(),
      child: Scaffold(
        appBar: AppBar(),
        body: const WeatherPlacesView(),
      ),
    );
  }
}

class WeatherPlacesView extends StatelessWidget {
  const WeatherPlacesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WeatherPlacesCubit, WeatherPlacesState>(
      builder: (context, state) {
        switch (state.status) {
          case WeatherPlacesStatus.loading:
            return const Center(child: CircularProgressIndicator());
          case WeatherPlacesStatus.success:
            return _body(state: state);
          case WeatherPlacesStatus.error:
            return const Text('HA OCURRIDO UN ERROR');
        }
      },
    );
  }

  Widget _body({required WeatherPlacesState state}) {
    return WeatherPlacesList(
      from: state.from,
      to: state.to,
    );
  }
}
