import 'package:flutter/material.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

import '../../../../utils/utils_widgets.dart';

class CardWeatherDetails extends StatelessWidget {
  const CardWeatherDetails(
      {super.key, required this.place, required this.indexDay});

  final PlaceModel place;
  final int indexDay;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 3),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _day(),
              spaceVertical(),
              Text(
                place.display,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              spaceVertical(),
              _componentInformation(
                icon: Icons.thermostat,
                label: 'Sensacion termcica',
                information: '${place.weather!.daily[indexDay].feelsLike.day}',
              ),
              spaceVertical(),
              _componentInformation(
                icon: Icons.air,
                label: 'Velocidad viento',
                information: '${place.weather?.daily[indexDay].windSpeed} m/s',
              ),
              spaceVertical(),
              _componentInformation(
                icon: Icons.umbrella,
                label: 'Precipitacion',
                information: '${place.weather!.daily[indexDay].pop * 100} %',
              ),
              spaceVertical(),
              _componentInformation(
                icon: Icons.water_drop_outlined,
                label: 'Humedad',
                information: '${place.weather?.daily[indexDay].humidity}',
              ),
              spaceVertical(),
              _componentInformation(
                icon: Icons.cloud_outlined,
                label: 'Nubes',
                information: '${place.weather!.daily[indexDay].clouds}',
              ),
              spaceVertical(),
              _componentInformation(
                icon: Icons.wb_sunny_outlined,
                label: 'UV Index',
                information: '${place.weather?.daily[indexDay].uvi}',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _day() {
    final date = DateTime.fromMillisecondsSinceEpoch(
      place.weather!.daily[indexDay].dt,
    ).toUtc();
    return Text('${date.day}/${date.month}/${date.year}');
  }

  Widget _componentInformation({
    required IconData icon,
    required String label,
    required String information,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.grey.withOpacity(.2),
            borderRadius: const BorderRadius.all(
              Radius.circular(10000),
            ),
          ),
          child: Icon(
            icon,
            size: 15,
          ),
        ),
        spaceHorizontal(),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[500],
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              spaceVertical(),
              Text(
                information,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
