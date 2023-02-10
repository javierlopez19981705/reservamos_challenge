import 'package:flutter/material.dart';
import 'package:reservamos_challenge/src/pages/weather_places/view/widgets/card_weather_details.dart';
import 'package:reservamos_challenge/src/pages/weather_places/view/widgets/card_weather_place.dart';
import 'package:reservamos_challenge/src/utils/utils_widgets.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

class SlideWeather extends StatelessWidget {
  const SlideWeather(
      {super.key,
      required this.from,
      required this.to,
      required this.indexWeather});
  final PlaceModel from;
  final PlaceModel to;
  final int indexWeather;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              _day(),
              spaceVertical(),
              CardWeatherPlace(
                place: from,
                index: indexWeather,
              ),
              spaceVertical(),
              spaceVertical(),
              CardWeatherPlace(
                place: to,
                index: indexWeather,
              ),
              spaceVertical(),
              spaceVertical(),
              Row(
                children: [
                  Expanded(
                    child: CardWeatherDetails(
                      indexDay: indexWeather,
                      place: from,
                    ),
                  ),
                  Expanded(
                    child: CardWeatherDetails(
                      indexDay: indexWeather,
                      place: to,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _day() {
    final date = DateTime.fromMillisecondsSinceEpoch(
      from.weather!.daily[indexWeather].dt,
    ).toUtc();

    const style = TextStyle(
      fontSize: 32,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    );
    return Text('${date.day}/${date.month}/${date.year}', style: style);
  }
}
