import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/services/cache_service.dart';
import 'package:graduation_project/features/orders/data/models/order_products.dart';

import '../../../../orders/data/models/create_order_model.dart';
import '../../../../orders/data/models/order_location_model.dart';
import '../../../../orders/domain/entities/order_location_entity.dart';
import '../../../../orders/domain/use_cases/create_order_use_case.dart';
import '../../../../orders/domain/use_cases/get_current_order_location_use_case.dart';
import '../../../../orders/domain/use_cases/set_order_location_use_case.dart';
import '../../../data/models/pay_mob_request_model.dart';
import '../../../domain/entities/pay_mob_entity.dart';
import '../../../domain/use_cases/get_pay_mob_client_key_use_case.dart';
import '../../widgets/payment_method.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit(
      {required GetPayMobClientKeyUseCase getPayMobClientKeyUseCase,
      required SetOrderLocationUseCase setOrderLocationUseCase,
      required CreateOrderUseCase createOrderUseCase,
      required GetCurrentOrderLocationUseCase getCurrentOrderLocationUseCase,
      required this.orderProducts,
      required this.paymentAmount})
      : _getPayMobClientKeyUseCase = getPayMobClientKeyUseCase,
        _setOrderLocationUseCase = setOrderLocationUseCase,
        _createOrderUseCase = createOrderUseCase,
        _getCurrentOrderLocationUseCase = getCurrentOrderLocationUseCase,
        super(PaymentInitial());
  PaymentMethod paymentMethod = PaymentMethod.cash;
  final GetPayMobClientKeyUseCase _getPayMobClientKeyUseCase;
  final SetOrderLocationUseCase _setOrderLocationUseCase;
  final CreateOrderUseCase _createOrderUseCase;
  final GetCurrentOrderLocationUseCase _getCurrentOrderLocationUseCase;
  final num paymentAmount;
  final List<OrderProducts> orderProducts;
  OrderLocationEntity? orderPastLocationEntity;

  OrderLocationEntity get orderLocationEntity =>
      orderPastLocationEntity ??
      OrderLocationEntity(
        orderAddress: address ?? '',
        orderCity: city ?? '',
        orderBuildingNo: buildingNo ?? '',
        orderApartmentNo: apartmentNumber ?? '',
        orderFloorNo: floorNumber ?? '',
        orderStreetName: streetName ?? '',
      );
  String? address;

  String? city;

  String? buildingNo;

  String? floorNumber;

  String? apartmentNumber;

  String? streetName;

  String? notes;

  void setAddress(String? address) {
    this.address = address;
  }

  void setCity(String? city) {
    this.city = city;
  }

  void setBuildingNo(String? buildingNo) {
    this.buildingNo = buildingNo;
  }

  void setFloorNumber(String? floorNumber) {
    this.floorNumber = floorNumber;
  }

  void setApartmentNumber(String? apartmentNumber) {
    this.apartmentNumber = apartmentNumber;
  }

  void setStreetName(String? streetName) {
    this.streetName = streetName;
  }

  void setNotes(String? notes) {
    this.notes = notes;
  }

  Future<void> getPaymentKey() async {
    final result = await _getPayMobClientKeyUseCase(
        payMobRequestModel: PayMobRequestModel(
            amount: ((paymentAmount + AppConstants.shippingCost) * 100).toInt(),
            currency: 'EGP',
            paymentMethods: [5076561, 'card'],
            billingData: BillingData(
                firstName: 'yousef',
                lastName: 'nageh',
                phoneNumber: '201234567890')));
    result.fold(
      (failure) => emit(PaymentErrorState(failure.errorMessage)),
      (payMobEntity) {
        emit(PaymentSuccessState(payMobEntity));
      },
    );
  }

  void setPaymentMethod(PaymentMethod method) {
    paymentMethod = method;
  }

  final formKey = GlobalKey<FormState>();

  Future<void> setOrderLocation() async {
    emit(PaymentLoadingState());
    final result = await _setOrderLocationUseCase(
        orderLocationModel: OrderLocationModel(
      address: address,
      city: city,
      buildingNo: buildingNo,
      apartmentNo: apartmentNumber,
      floorNo: floorNumber,
      phoneNo: '201234567890',
      streetName: streetName,
    ));
    result.fold(
      (failure) {
        emit(PaymentErrorState(failure.errorMessage));
      },
      (_) => payNow(),
    );
  }

  void payNow() {
    switch (paymentMethod) {
      case PaymentMethod.cash:
        createOrder();
      case PaymentMethod.visa:
        getPaymentKey();
        break;
    }
  }

  Future<void> createOrder() async {
    if (state is! PaymentLoadingState) {
      emit(PaymentLoadingState());
    }
    final result = await _createOrderUseCase(
        createOrderModel: CreateOrderModel(
      userId: CacheService.getData(key: AppConstants.userId),
      notes: notes,
      paymentMethod: paymentMethod.value,
      orderProducts: orderProducts,
    ));
    result.fold(
      (failure) {
        emit(PaymentErrorState(failure.errorMessage));
      },
      (_) {
        emit(PaymentSuccessState(null));
      },
    );
  }

  void onTapByNow() {
    if (!formKey.currentState!.validate()) return;
    formKey.currentState!.save();
    if (orderPastLocationEntity == orderLocationEntity) {
      payNow();
    } else {
      setOrderLocation();
    }
  }

  Future<void> getCurrentOrderLocation() async {
    final result = await _getCurrentOrderLocationUseCase();
    result.fold(
      (failure) {
        emit(PaymentErrorState(failure.errorMessage));
      },
      (orderLocationEntity) {
        orderPastLocationEntity = orderLocationEntity;
        address = orderLocationEntity.orderAddress;
        city = orderLocationEntity.orderCity;
        buildingNo = orderLocationEntity.orderBuildingNo;
        apartmentNumber = orderLocationEntity.orderApartmentNo;
        floorNumber = orderLocationEntity.orderFloorNo;
        streetName = orderLocationEntity.orderStreetName;

        emit(GetCurrentOrderLocationState(orderLocationEntity));
      },
    );
  }
}
