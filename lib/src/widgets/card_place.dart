import 'package:flutter/material.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

class CardPlace extends StatelessWidget {
  const CardPlace({
    super.key,
    required this.place,
  });
  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(place.cityName),
      ),
    );
  }
}
