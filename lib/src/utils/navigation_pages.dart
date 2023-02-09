import 'package:flutter/material.dart';
import 'package:reservamos_challenge/src/pages/search_place/view/search_place_page.dart';

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
}
