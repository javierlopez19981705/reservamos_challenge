import 'package:flutter/material.dart';

class ResultTypeIconPlace extends StatelessWidget {
  const ResultTypeIconPlace({required this.type, super.key});

  final String type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(10000),
        ),
      ),
      child: Icon(
        _getIcon(),
        size: 18,
      ),
    );
  }

  IconData _getIcon() {
    if (type == 'city') {
      return Icons.place;
    } else if (type == 'terminal') {
      return Icons.directions_bus_outlined;
    } else {
      return Icons.flight;
    }
  }
}
