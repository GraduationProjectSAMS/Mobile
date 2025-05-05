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

  Future<void> _updateLocationInfo(LatLng position) async {
    final placeMarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placeMarks.isNotEmpty) {
      final place = placeMarks.first;
      Logger().i(place);
      setState(() {
        _selectedPlaceMark = place;
        _selectedMarker = Marker(
          markerId: const MarkerId('picked-location'),
          position: position,
        );
        _mapController?.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(target: position, zoom: 14),
          ),
        );
      });
    }
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
            target: _initialLatLng!,
            zoom: 14,
          ),
          onMapCreated: (controller) => _mapController = controller,
          myLocationEnabled: true,
          myLocationButtonEnabled: false,
          // hide default button
          onTap: _updateLocationInfo,
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
                        height: 40,
                        width: 200,
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
