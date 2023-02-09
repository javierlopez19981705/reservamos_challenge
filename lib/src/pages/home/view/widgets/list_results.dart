import 'package:flutter/material.dart';
import 'package:reservamos_challenge/src/widgets/card_place.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

class ListResults extends StatelessWidget {
  const ListResults({
    super.key,
    required this.places,
  });

  final List<PlaceModel> places;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final place = places[index];
        return CardPlace(place: place);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
      itemCount: places.length,
    );
  }
}
