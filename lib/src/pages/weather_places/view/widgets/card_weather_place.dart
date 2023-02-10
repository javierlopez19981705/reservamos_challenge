import 'package:flutter/material.dart';
import 'package:reservamos_challenge/src/utils/utils_widgets.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

class CardWeatherPlace extends StatelessWidget {
  const CardWeatherPlace({required this.place, required this.index, super.key});

  final PlaceModel place;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Theme.of(context).cardColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey[800]!.withOpacity(.25),
            offset: const Offset(3, 4),
            blurRadius: 2.5,
          )
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _displayName(),
          spaceVertical(),
          _temp(),
          spaceVertical(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text('Min'),
                  Text('${place.weather?.daily[index].temp.min} °C'),
                ],
              ),
              Column(
                children: [
                  const Text('Max'),
                  Text('${place.weather?.daily[index].temp.max} °C'),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget _displayName() {
    return Text(
      place.display,
      style: const TextStyle(
        fontSize: 20,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }

  Widget _temp() {
    return Text(
      '${place.weather?.daily[index].temp.day} °C',
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
