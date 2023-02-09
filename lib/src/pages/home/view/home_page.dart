import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos_challenge/src/pages/home/cubit/home_cubit.dart';
import 'package:reservamos_challenge/src/pages/home/view/widgets/list_results.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(
        context.read<ReservamosRepository>(),
      )..getPlaces(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          switch (state.status) {
            case HomeStatus.loading:
              return const Center(child: CircularProgressIndicator());
            case HomeStatus.sucess:
              return ListResults(places: state.places);
            case HomeStatus.error:
              return const Center(child: Text('HA OCURRIDO UN ERRO'));
          }
        },
      ),
    );
  }
}
