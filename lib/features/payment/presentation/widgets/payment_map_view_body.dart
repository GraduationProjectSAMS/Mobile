import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';
import 'package:logger/logger.dart';

import '../../../../core/utilities/resources/app_colors.dart';

class PaymentMapViewBody extends StatefulWidget {
  const PaymentMapViewBody({super.key});

  @override
  PaymentMapViewBodyState createState() => PaymentMapViewBodyState();
}

class PaymentMapViewBodyState extends State<PaymentMapViewBody> {
  GoogleMapController? _mapController;
  LatLng? _initialLatLng;
  Placemark? _selectedPlaceMark;
  Marker? _selectedMarker;
  bool _isLoading = false;

  String get _address =>
      '${_selectedPlaceMark?.street}, ${_selectedPlaceMark?.locality}, ${_selectedPlaceMark?.country}';

  String get buildingName => _selectedPlaceMark?.thoroughfare ?? '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)?.settings.arguments as Position;
    _initialLatLng = LatLng(args.latitude, args.longitude);
    _updateLocationInfo(_initialLatLng!);
  }

  final LatLngBounds _egyptBounds = LatLngBounds(
    southwest: const LatLng(22.0, 24.7), // Near Sudan border
    northeast: const LatLng(31.7, 36.9), // Near Mediterranean
  );

  Future<void> _updateLocationInfo(LatLng position) async {
    setState(() {
      _isLoading = true;
    });

    final placeMarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placeMarks.isNotEmpty) {
      final place = placeMarks.first;
      Logger().i(place);
      final currentZoom = await _mapController?.getZoomLevel() ?? 14;

      setState(() {
        _selectedPlaceMark = place;
        _selectedMarker = Marker(
          markerId: const MarkerId('picked-location'),
          position: position,
        );
      });

      _mapController?.animateCamera(
        CameraUpdate.newLatLngZoom(position, currentZoom), // ✅ keep same zoom
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  Future<void> _goToMyLocation() async {
    final latLng = _initialLatLng!;
    _updateLocationInfo(latLng);
  }

  @override
  Widget build(BuildContext context) {
    if (_initialLatLng == null) {
      return const Center(child: CircularProgressIndicator());
    }

    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition: CameraPosition(
            target: _initialLatLng!, // ✅ Use your dynamic position
            zoom: 14,
          ),
          onMapCreated: (controller) {
            _mapController = controller;

            // Ensure camera starts within Egypt bounds even if _initialLatLng is near edge
            if (!_egyptBounds.contains(_initialLatLng!)) {
              // fallback to Egypt center
              const egyptCenter = LatLng(26.8206, 30.8025);
              controller
                  .moveCamera(CameraUpdate.newLatLngZoom(egyptCenter, 6.5));
            } else {
              controller
                  .moveCamera(CameraUpdate.newLatLngZoom(_initialLatLng!, 14));
            }
          },
          cameraTargetBounds: CameraTargetBounds(_egyptBounds),
          // ⛔ restrict pan
          minMaxZoomPreference: const MinMaxZoomPreference(6.5, 25),
          // ⛔ restrict zoom out
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          onTap: (position) {
            if (_egyptBounds.contains(position)) {
              _updateLocationInfo(position);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Please select a location inside Egypt')),
              );
            }
          },
          markers: _selectedMarker != null ? {_selectedMarker!} : {},
        ),

        // Custom My Location Button
        Positioned(
          top: 20,
          right: 10,
          child: FloatingActionButton(
            backgroundColor: AppColors.primary,
            mini: true,
            onPressed: _goToMyLocation,
            child: const Icon(
              Icons.my_location,
              color: AppColors.white,
            ),
          ),
        ),

        // Address Card
        if (_selectedPlaceMark != null)
          Positioned(
            bottom: 20,
            left: 10,
            right: 10,
            child: Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (buildingName.isNotEmpty)
                      Text(
                        buildingName,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppStyles.textStyle20,
                      ),
                    Text(
                      _address,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    Center(
                      child: MyButton(
                        isLoading: _isLoading,
                        height: 40,
                        width: 50.wR,
                        onPressed: () {
                          context.pop(result: _selectedPlaceMark);
                        },
                        text: 'Confirm Location',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
