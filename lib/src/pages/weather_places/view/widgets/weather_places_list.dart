import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/widgets.dart';
import 'package:reservamos_challenge/src/pages/weather_places/view/widgets/slide_weather.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

class WeatherPlacesList extends StatelessWidget {
  const WeatherPlacesList({super.key, required this.from, required this.to});
  final PlaceModel from;
  final PlaceModel to;

  @override
  Widget build(BuildContext context) {
    return Swiper(
      viewportFraction: 0.8,
      scale: 0.9,
      itemBuilder: (BuildContext context, int index) {
        return SlideWeather(from: from, to: to, indexWeather: index);
      },
      itemCount: 8,
    );
  }
}
