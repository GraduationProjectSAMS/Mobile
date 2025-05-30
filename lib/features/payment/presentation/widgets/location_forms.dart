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

import '../../../../core/widgets/my_text_form_field.dart';
import '../manager/payment_cubit/payment_cubit.dart';

class LocationForms extends StatefulWidget {
  const LocationForms({super.key});

  @override
  State<LocationForms> createState() => _LocationFormsState();
}

class _LocationFormsState extends State<LocationForms> {
  late final TextEditingController _cityController;
  late final TextEditingController _streetNameController;
  late final TextEditingController _buildingNoController;
  late final TextEditingController _floorNoController;
  late final TextEditingController _apartmentNoController;

  late final PaymentCubit cubit;

  final _addressNotifier = ValueNotifier<String?>(null);

  @override
  void initState() {
    super.initState();
    _cityController = TextEditingController();
    _streetNameController = TextEditingController();
    _buildingNoController = TextEditingController();
    _floorNoController = TextEditingController();
    _apartmentNoController = TextEditingController();
    cubit = context.read<PaymentCubit>();
  }

  @override
  void dispose() {
    _cityController.dispose();
    _streetNameController.dispose();
    _buildingNoController.dispose();
    _floorNoController.dispose();
    _apartmentNoController.dispose();
    cubit.formKey.currentState?.dispose();
    cubit.formKey.currentState?.reset();

    super.dispose();
  }

  String _formattedAddress(Placemark selectedPlaceMark) {
    final p = selectedPlaceMark;
    final parts = [
      p.street, // This is the composite 'street' with Plus Code
      p.subThoroughfare,
      p.thoroughfare,
      p.subLocality,
    ];

    return parts.where((e) => e != null && e.trim().isNotEmpty).join(', ');
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
    _cityController.text =
        '${placemark.country}, ${placemark.administrativeArea}';
    _streetNameController.text =
        '${placemark.locality}, ${placemark.subLocality}';
    _addressNotifier.value = _formattedAddress(placemark);
    cubit.setAddress(_addressNotifier.value);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentCubit, PaymentStates>(
      listener: (context, state) {
        if (state is GetCurrentOrderLocationState) {
          final entity = state.orderLocationEntity;
          _addressNotifier.value = entity.orderAddress;
          _cityController.text = entity.orderCity;
          _streetNameController.text = entity.orderStreetName;
          _buildingNoController.text = entity.orderBuildingNo;
          _floorNoController.text = entity.orderFloorNo;
          _apartmentNoController.text = entity.orderApartmentNo;
        }
      },
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ValueListenableBuilder(
                valueListenable: _addressNotifier,
                builder: (BuildContext context, String? value, Widget? child) =>
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
                          value == null || value.isEmpty
                              ? AppStrings.addLocationOnMap
                              : value,
                          style: AppStyles.defaultStyle,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              MyTextFormField(
                onSaved: cubit.setCity,
                validator: ValidatorService.emptyValidator,
                controller: _cityController,
                labelText: AppStrings.city,
                hintText: AppStrings.city,
              ),
              const SizedBox(height: 10),
              MyTextFormField(
                onSaved: cubit.setStreetName,
                validator: ValidatorService.emptyValidator,
                controller: _streetNameController,
                labelText: AppStrings.streetName,
                hintText: AppStrings.streetName,
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: MyTextFormField(
                      controller: _buildingNoController,
                      onSaved: cubit.setBuildingNo,
                      validator: ValidatorService.emptyValidator,
                      hintText: AppStrings.buildingNumber,
                      labelText: AppStrings.buildingNumber,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: MyTextFormField(
                      controller: _floorNoController,
                      onSaved: cubit.setFloorNumber,
                      validator: ValidatorService.emptyValidator,
                      hintText: AppStrings.floorNumber,
                      keyboardType: TextInputType.number,
                      labelText: AppStrings.floorNumber,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: MyTextFormField(
                      controller: _apartmentNoController,
                      onSaved: cubit.setApartmentNumber,
                      validator: ValidatorService.emptyValidator,
                      labelText: AppStrings.apartmentNumber,
                      keyboardType: TextInputType.number,
                      hintText: AppStrings.apartmentNumber,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              MyTextFormField(
                keyboardType: TextInputType.multiline,
                onSaved: cubit.setNotes,
                hintText: AppStrings.notes,
                labelText: AppStrings.notes,
                maxLines: 5,
                minLines: 3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
