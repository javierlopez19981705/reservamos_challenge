import 'package:weather_repository/weather_repository.dart';
import 'package:weather_service/weather_service.dart';

void main() async {
  WeatherRepository service = WeatherRepository();
  final data = await service.getWeather(
    lat: '20.66230215178363',
    lon: '-103.3447069232788',
  );
  print(data);
}
