import 'dart:convert';

import 'package:http/http.dart' as http;

///
class ReservamosService {
  ///
  ReservamosService({
    http.Client? httpClient,
  }) : _httpClient = httpClient ?? http.Client();

  /// {@macro reservamos_service}
  // ReservamosService();

  final http.Client _httpClient;
  final String _baseUrl = 'search.reservamos.mx';

  ///https://search.reservamos.mx/api/v2/places
  final String _endPoint = 'api/v2/places';

  ///
  Future<List<Map<String, dynamic>>> fetchPlaces({
    String? q,
    String? from,
    String? to,
  }) async {
    final parameters = {
      'q': q,
    };

    from == null ? parameters.addAll({}) : parameters.addAll({'from': from});
    to == null ? parameters.addAll({}) : parameters.addAll({'to': to});

    http.Response response;
    List<dynamic> body;

    final uri = Uri.https(_baseUrl, _endPoint, parameters);

    try {
      response = await _httpClient.get(uri);
    } on Exception {
      throw HttpRequestException();
    }

    if (response.statusCode != 201) {
      throw HttpRequestException();
    }

    try {
      body = jsonDecode(response.body) as List;
    } on Exception {
      throw JsonDecodeException();
    }

    try {
      return body.map((element) {
        return element as Map<String, dynamic>;
      }).toList();
    } on Exception {
      throw JsonDecodeException();
    }
  }
}

///
class HttpRequestException implements Exception {}

///
class JsonDecodeException implements Exception {}
