import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/resources/app_colors.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/utilities/services/validator_service.dart';
import 'package:graduation_project/core/widgets/app_cusstom_drop_down_menu.dart';

import '../manager/payment_cubit/payment_cubit.dart';

class LocationForms extends StatefulWidget {
  const LocationForms({super.key});

  @override
  State<LocationForms> createState() => _LocationFormsState();
}

class _LocationFormsState extends State<LocationForms> {
  late final TextEditingController _countryController;
  late final TextEditingController _streetNameController;
  Placemark? _selectedPlaceMark;

  @override
  void initState() {
    super.initState();
    _countryController = TextEditingController();
    _streetNameController = TextEditingController();
  }

  @override
  void dispose() {
    _countryController.dispose();
    _streetNameController.dispose();
    super.dispose();
  }

  String get _formattedAddress {
    final p = _selectedPlaceMark;
    return '${p?.thoroughfare ?? ''}, ${p?.street ?? ''}, ${p?.locality ?? ''}, ${p?.country ?? ''}';
  }

  Future<Position> _determinePosition() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return Geolocator.getCurrentPosition();
  }

  void _handleLocationSelection() async {
    try {
      final position = await _determinePosition();
      if (!mounted) return;

      final result = await context.navigateTo(
        pageName: AppRoutes.paymentMap,
        arguments: position,
      );

      if (result is Placemark) {
        _updateTextFieldsFromPlacemark(result);
      }
    } catch (error) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text('$error'),
        ),
      );
    }
  }

  void _updateTextFieldsFromPlacemark(Placemark placemark) {
    setState(() {
      _selectedPlaceMark = placemark;
      _countryController.text = placemark.country ?? '';
      _streetNameController.text = placemark.street ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: context.read<PaymentCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MaterialButton(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              onPressed: _handleLocationSelection,
              child: Row(
                children: [
                  const Icon(Icons.location_on, color: AppColors.primary),
                  const SizedBox(width: 3),
                  Flexible(
                    child: Text(
                      _selectedPlaceMark == null
                          ? AppStrings.addLocationOnMap
                          : _formattedAddress,
                      style: AppStyles.defaultStyle,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            MyTextField(
              validator: ValidatorService.emptyValidator,
              controller: _countryController,
              label: AppStrings.country,
              hint: AppStrings.country,
              fillColor: Colors.white,
            ),
            const SizedBox(height: 10),
            MyTextField(
              validator: ValidatorService.emptyValidator,
              controller: _streetNameController,
              hint: AppStrings.streetName,
              label: AppStrings.streetName,
              fillColor: Colors.white,
            ),
            const SizedBox(height: 10),
            const MyTextField(
              hint: AppStrings.buildingNumber,
              label: AppStrings.buildingNumber,
              fillColor: Colors.white,
            ),
            const SizedBox(height: 10),
            const MyTextField(
              hint: AppStrings.floorWithApartment,
              label: AppStrings.floorWithApartment,
              fillColor: Colors.white,
            ),
            const SizedBox(height: 10),
            const MyTextField(
              hint: AppStrings.notes,
              label: AppStrings.notes,
              maxLines: 5,
              minLines: 3,
              fillColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
