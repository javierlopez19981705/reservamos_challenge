import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reservamos_challenge/src/pages/home/cubit/home_cubit.dart';
import 'package:reservamos_challenge/src/utils/utils_widgets.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

class CardPlace extends StatelessWidget {
  const CardPlace({
    super.key,
    required this.place,
    required this.indexDay,
  });
  final PlaceModel place;
  final int indexDay;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _day(),
            spaceVertical(),
            Text(place.display),
            spaceVertical(),
            _windAndFeelLike(),
            spaceVertical(),
            _humidityAndPressure(),
            spaceVertical(),
            _rainAndUv(),
            spaceHorizontal(),
            ElevatedButton(
              onPressed: () {
                context.read<HomeCubit>().selectFrom(place: place);
              },
              child: const Text('Buscar'),
            )
          ],
        ),
      ),
    );
  }

  Widget _day() {
    final today = DateTime.now().toUtc();
    final date = DateTime.fromMillisecondsSinceEpoch(
      place.weather!.daily[indexDay].dt,
    ).toUtc();

    final differenceDays = date.difference(today).inDays;

    switch (differenceDays) {
      case 0:
        return const Text('Hoy');
      case 1:
        return const Text('Mañana');
      case 2:
        return const Text('Pasado mañana');
      default:
        return Text('${date.day}/${date.month}/${date.year}');
    }
  }

  Widget _windAndFeelLike() {
    return Row(
      children: [
        _componentInformation(
          icon: Icons.thermostat,
          label: 'Sensacion termcica',
          information: '${place.weather!.daily[indexDay].feelsLike.day}',
        ),
        _componentInformation(
          icon: Icons.air,
          label: 'Velocidad viento',
          information: '${place.weather?.daily[indexDay].windSpeed} m/s',
        ),
      ],
    );
  }

  Widget _humidityAndPressure() {
    return Row(
      children: [
        _componentInformation(
          icon: Icons.umbrella,
          label: 'Precipitacion',
          information: '${place.weather!.daily[indexDay].pop * 100} %',
        ),
        _componentInformation(
          icon: Icons.water_drop_outlined,
          label: 'Humedad',
          information: '${place.weather?.daily[indexDay].humidity}',
        ),
      ],
    );
  }

  Widget _rainAndUv() {
    return Row(
      children: [
        _componentInformation(
          icon: Icons.cloud_outlined,
          label: 'Nubes',
          information: '${place.weather!.daily[indexDay].clouds}',
        ),
        _componentInformation(
          icon: Icons.wb_sunny_outlined,
          label: 'UV Index',
          information: '${place.weather?.daily[indexDay].uvi}',
        ),
      ],
    );
  }

  Widget _componentInformation({
    required IconData icon,
    required String label,
    required String information,
  }) {
    return Expanded(
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: const BorderRadius.all(
                Radius.circular(10000),
              ),
            ),
            child: Icon(icon),
          ),
          spaceHorizontal(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  color: Colors.grey[500],
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
        ],
      ),
    );
  }
}
