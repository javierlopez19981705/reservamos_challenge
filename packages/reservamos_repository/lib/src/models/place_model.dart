import 'package:weather_repository/weather_repository.dart';

///
class PlaceModel {
  ///
  PlaceModel({
    required this.id,
    required this.slug,
    required this.citySlug,
    required this.display,
    required this.asciiDisplay,
    required this.cityName,
    required this.cityAsciiName,
    required this.state,
    required this.country,
    required this.lat,
    required this.long,
    required this.resultType,
    required this.popularity,
    this.sortCriteria,
  });

  ///
  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    return PlaceModel(
      id: json['id'] as int,
      slug: json['slug'] as String,
      citySlug: json['city_slug'] as String,
      display: json['display'] as String,
      asciiDisplay: json['ascii_display'] as String,
      cityName: json['city_name'] as String,
      cityAsciiName: json['city_ascii_name'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      resultType: json['result_type'] as String,
      popularity: json['popularity'] as String,
      sortCriteria: double.tryParse('${json['sort_criteria']}'),
    );
  }

  ///
  int id;

  ///
  String slug;

  ///
  String citySlug;

  ///
  String display;

  ///
  String asciiDisplay;

  ///
  String cityName;

  ///
  String cityAsciiName;

  ///
  String state;

  ///
  String country;

  ///
  String? lat;

  ///
  String? long;

  ///
  String resultType;

  ///
  String popularity;

  ///
  double? sortCriteria;

  ///
  WeatherModel? weather;

  ///
  Map<String, dynamic> toJson() => {
        'id': id,
        'slug': slug,
        'city_slug': citySlug,
        'display': display,
        'ascii_display': asciiDisplay,
        'city_name': cityName,
        'city_ascii_name': cityAsciiName,
        'state': state,
        'country': country,
        'lat': lat,
        'long': long,
        'result_type': resultType,
        'popularity': popularity,
        'sort_criteria': sortCriteria.toString(),
      };
}



// enum ResultType { CITY, AIRPORT, TERMINAL }

// final resultTypeValues = EnumValues({
//     "airport": ResultType.AIRPORT,
//     "city": ResultType.CITY,
//     "terminal": ResultType.TERMINAL
// });

// class EnumValues<T> {
//     Map<String, T> map;
//     late Map<T, String> reverseMap;

//     EnumValues(this.map);

//     Map<T, String> get reverse {
//         reverseMap = map.map((k, v) => MapEntry(v, k));
//         return reverseMap;
//     }
// }
