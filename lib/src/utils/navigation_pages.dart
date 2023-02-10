import 'package:flutter/material.dart';
import 'package:reservamos_challenge/src/pages/search_place/view/search_place_page.dart';
import 'package:reservamos_challenge/src/pages/weather_places/view/weather_places_page.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

class NavigationPages {
  static searchPlaces({
    required BuildContext context,
    bool isFrom = true,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SearchPlacePage(
          isFrom: isFrom,
        ),
      ),
    );
  }

  static weatherPage({
    required BuildContext context,
    required PlaceModel from,
    required PlaceModel to,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherPlacesPage(
          from: from,
          to: to,
        ),
      ),
    );
  }
}
