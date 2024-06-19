import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:location_mapbox_flutter/config/routes.dart';
import 'package:location_mapbox_flutter/theme/colors.dart';
import 'package:location_mapbox_flutter/view/widgets/button.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

import '../widgets/headder.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  MapboxMap? mapboxMap;

  TextEditingController startSearchController = TextEditingController();
  TextEditingController endSearchController = TextEditingController();

  FocusNode startFocusNode = FocusNode();
  FocusNode endFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    _onMapCreated(MapboxMap map) {
      mapboxMap = map;
    }

    return Scaffold(
      body: Column(
        children: [
          const ScreenHeadder(),
          Expanded(
            child: InkWell(
              onTap: () {
                startFocusNode.requestFocus();
              },
              child: Container(
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
                    searchField('Start location', startSearchController,
                        startFocusNode),
                    const SizedBox(height: 10),
                    Expanded(
                      child: MapWidget(
                        key: const ValueKey("mapWidget"),
                        onMapCreated: _onMapCreated,
                        cameraOptions: CameraOptions(
                          center:
                              Point(coordinates: Position(-80.1263, 25.7845)),
                          zoom: 12.0,
                        ),
                        onTapListener: (tapGestures) {
                          startFocusNode.requestFocus();
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
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
                  searchField(
                      'Start location', startSearchController, endFocusNode),
                  const SizedBox(height: 10),
                  Expanded(
                    child: MapWidget(
                      key: const ValueKey("mapWidget"),
                      onTapListener: (tapGesture) {
                        endFocusNode.requestFocus();
                      },
                      onMapCreated: _onMapCreated,
                      cameraOptions: CameraOptions(
                        center: Point(coordinates: Position(-80.1263, 25.7845)),
                        zoom: 12.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CustomButton(
              text: 'Navigate',
              onTap: () => Navigator.pushNamed(context, AppRoutes.result),
            ),
            CustomButton(
              text: 'Saved',
              onTap: () => Navigator.pushNamed(context, AppRoutes.history),
            ),
          ],
        ),
      ),
    );
  }

  Widget searchField(
      String label, TextEditingController controller, FocusNode focusNode) {
    return TypeAheadField(
      focusNode: focusNode,
      suggestionsCallback: (search) {},
      builder: (context, controller, focusNode) {
        return TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          decoration: InputDecoration(
            hintText: label,
            contentPadding: const EdgeInsets.all(16),
            border: InputBorder.none,
            prefixIcon: const Icon(Icons.location_on_outlined),
          ),
        );
      },
      itemBuilder: (context, suggesion) {
        return const ListTile(
          title: Text('suggesion'),
          subtitle: Text('suggesion'),
        );
      },
      onSelected: (suggesion) {
        controller.text = '';
      },
    );
  }
}
