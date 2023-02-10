import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos_challenge/src/pages/home/view/widgets/header_results.dart';
import 'package:reservamos_challenge/src/utils/utils_widgets.dart';
import 'package:sliver_tools/sliver_tools.dart';

import 'package:reservamos_challenge/src/pages/home/cubit/home_cubit.dart';
import 'package:reservamos_challenge/src/pages/home/view/widgets/list_results.dart';

import '../../../utils/labels.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
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
              return _body(state: state);
            case HomeStatus.error:
              return const Center(child: Text('HA OCURRIDO UN ERROR'));
          }
        },
      ),
    );
  }

  Widget _body({required HomeState state}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverPinnedHeader(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderResult(),
                spaceVertical(),
                const Text(
                  Labels.popularLocations,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                spaceVertical(),
              ],
            ),
          ),
          SliverClip(
            child: ListResults(places: state.places),
          ),
        ],
      ),
    );
  }
}
