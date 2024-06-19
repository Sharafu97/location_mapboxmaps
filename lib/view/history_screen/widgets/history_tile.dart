import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../../../theme/colors.dart';

class HistoryTile extends StatelessWidget {
  HistoryTile({super.key});

  MapboxMap? mapboxMap;

  _onMapCreated(MapboxMap map) {
    mapboxMap = map;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 150,
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: AppColors.whiteFFFFFF,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: AppColors.blue),
            boxShadow: [
              BoxShadow(color: AppColors.black000000.withOpacity(0.25))
            ]),
        child: Column(
          children: [
            Row(
              children: [Icon(Icons.location_on_sharp), Text('Start - End')],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: MapWidget(
                key: const ValueKey("mapWidget"),
                onMapCreated: _onMapCreated,
                cameraOptions: CameraOptions(
                  center: Point(coordinates: Position(-80.1263, 25.7845)),
                  zoom: 12.0,
                ),
                onTapListener: (tapGestures) {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
