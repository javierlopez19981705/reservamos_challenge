import 'package:flutter/material.dart';
import 'package:reservamos_challenge/src/utils/utils_widgets.dart';
import '../utils/labels.dart';
import 'package:reservamos_challenge/src/widgets/result_type_icon_place.dart';
import 'package:reservamos_repository/reservamos_repository.dart';

class CardPlaceSearch extends StatelessWidget {
  const CardPlaceSearch({
    required this.place,
    required this.isFrom,
    required this.onPressed,
    super.key,
  });

  final PlaceModel place;
  final bool isFrom;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              children: [
                ResultTypeIconPlace(type: place.resultType),
                spaceHorizontal(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        place.display,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      spaceVertical(),
                      Text(
                        '${place.cityName}, ${place.state}',
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                )
              ],
            ),
            ElevatedButton(
              onPressed: onPressed,
              child: const Text(Labels.selectabel),
            ),
          ],
        ),
      ),
    );
  }
}
