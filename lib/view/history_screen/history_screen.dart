import 'package:flutter/material.dart';
import 'package:location_mapbox_flutter/view/history_screen/widgets/history_tile.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../theme/colors.dart';
import '../widgets/button.dart';
import '../widgets/headder.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    MapboxMap? mapboxMap;

    _onMapCreated(MapboxMap map) {
      mapboxMap = map;
    }

    return Scaffold(
      body: Column(
        children: [
          const ScreenHeadder(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) {
                return HistoryTile();
              },
            ),
          )
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(text: 'Go back', onTap: () => Navigator.pop(context)),
          ],
        ),
      ),
    );
  }
}
