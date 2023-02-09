import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos_challenge/src/widgets/card_place_search.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

import '../../cubit/home_cubit.dart';

class ListResults extends StatelessWidget {
  const ListResults({
    super.key,
    required this.places,
  });

  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final place = places[index];
          return CardPlaceSearch(
            place: place,
            isFrom: true,
            onPressed: () {
              context.read<HomeCubit>().unselectTo();
              context.read<HomeCubit>().unselectFrom();

              context
                  .read<HomeCubit>()
                  .placeSelectSearch(place: place, isFrom: true);
            },
            // indexDay: 0,
          );
        },
        childCount: places.length,
      ),
    );
  }
}
