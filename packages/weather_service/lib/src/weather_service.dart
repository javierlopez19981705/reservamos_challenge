import 'dart:convert';

import 'package:http/http.dart' as http;

///
class WeatherService {
  /// {@macro weather_service}
  WeatherService({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// {@macro reservamos_service}
  // ReservamosService();

  final http.Client _httpClient;
  final String _baseUrl = 'api.openweathermap.org';
  final _apiKey = 'a5a47c18197737e8eeca634cd6acb581';

  ///
  Future<Map<String, dynamic>> fetchWeather({
    required String lat,
    required String lon,
  }) async {
    /// lat={lat}&lon={lon}&exclude={part}&appid={API key}
    const endPoint = 'data/2.5/onecall';
    final parameters = {
      'lat': lat,
      'lon': lon,
      'exclude': 'current,minutely,hourly',
      'appid': _apiKey,
    };

    http.Response response;
    dynamic body;

    final uri = Uri.https(_baseUrl, endPoint, parameters);
    print(uri.toString());
    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw HttpRequestException();
    }

    if (response.statusCode != 200) {
      throw HttpRequestException();
    }

    try {
      body = jsonDecode(response.body);
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      return body as Map<String, dynamic>;
    } on Exception {
      throw JsonDecodeException();
    }
  }
}

///
class HttpRequestException implements Exception {}

///
class JsonDecodeException implements Exception {}
