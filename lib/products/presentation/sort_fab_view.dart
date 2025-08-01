import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class SortFabView extends StatelessWidget {
  final void Function(String) onSortSelected;

  const SortFabView({super.key, required this.onSortSelected});

  @override
  Widget build(BuildContext context) {
    return SpeedDial(
      icon: Icons.sort,
      activeIcon: Icons.close,
      backgroundColor: Colors.green,
      foregroundColor: Colors.white,
      children: [
        SpeedDialChild(
          child: Icon(Icons.arrow_upward),
          label: 'Price: Low to High',
          onTap: () => onSortSelected('asc'),
        ),
        SpeedDialChild(
          child: Icon(Icons.arrow_downward),
          label: 'Price: High to Low',
          onTap: () => onSortSelected('desc'),
        ),
      ],
    );
  }
}