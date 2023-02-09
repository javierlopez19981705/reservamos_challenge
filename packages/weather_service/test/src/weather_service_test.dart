// ignore_for_file: prefer_const_constructors

import 'package:flutter_test/flutter_test.dart';
import 'package:weather_service/weather_service.dart';

void main() {
  group('WeatherService', () {
    test('can be instantiated', () {
      expect(WeatherService(), isNotNull);
    });
  });
}
