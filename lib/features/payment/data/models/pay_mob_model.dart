import '../../domain/entities/pay_mob_entity.dart';

class PayMobModel {
  PayMobModel({
    this.paymentKeys,
    this.intentionOrderId,
    this.id,
    this.intentionDetail,
    this.clientSecret,
    this.paymentMethods,
    this.specialReference,
    this.extras,
    this.confirmed,
    this.status,
    this.created,
    this.cardDetail,
    this.object,
  });

  PayMobModel.fromJson(dynamic json) {
    if (json['payment_keys'] != null) {
      paymentKeys = [];
      json['payment_keys'].forEach((v) {
        paymentKeys?.add(PaymentKeys.fromJson(v));
      });
    }
    intentionOrderId = json['intention_order_id'];
    id = json['id'];
    intentionDetail = json['intention_detail'] != null
        ? IntentionDetail.fromJson(json['intention_detail'])
        : null;
    clientSecret = json['client_secret'];
    if (json['payment_methods'] != null) {
      paymentMethods = [];
      json['payment_methods'].forEach((v) {
        paymentMethods?.add(PaymentMethods.fromJson(v));
      });
    }
    specialReference = json['special_reference'];
    extras = json['extras'] != null ? Extras.fromJson(json['extras']) : null;
    confirmed = json['confirmed'];
    status = json['status'];
    created = json['created'];
    cardDetail = json['card_detail'];

    object = json['object'];
  }

  List<PaymentKeys>? paymentKeys;
  num? intentionOrderId;
  String? id;
  IntentionDetail? intentionDetail;
  String? clientSecret;
  List<PaymentMethods>? paymentMethods;
  dynamic specialReference;
  Extras? extras;
  bool? confirmed;
  String? status;
  String? created;
  dynamic cardDetail;

  String? object;

  PayMobEntity get toEntity {
    return PayMobEntity(
      viewUrl: paymentKeys?.firstOrNull?.redirectionUrl ?? '',
      clientSecretKey: clientSecret ?? '',
    );
  }
}

class Extras {
  Extras({
    this.creationExtras,
    this.confirmationExtras,
  });

  Extras.fromJson(dynamic json) {
    creationExtras = json['creation_extras'];
    confirmationExtras = json['confirmation_extras'];
  }

  dynamic creationExtras;
  dynamic confirmationExtras;
}

class PaymentMethods {
  PaymentMethods({
    this.integrationId,
    this.alias,
    this.name,
    this.methodType,
    this.currency,
    this.live,
    this.useCvcWithMoto,
  });

  PaymentMethods.fromJson(dynamic json) {
    integrationId = json['integration_id'];
    alias = json['alias'];
    name = json['name'];
    methodType = json['method_type'];
    currency = json['currency'];
    live = json['live'];
    useCvcWithMoto = json['use_cvc_with_moto'];
  }

  num? integrationId;
  dynamic alias;
  dynamic name;
  String? methodType;
  String? currency;
  bool? live;
  bool? useCvcWithMoto;
}

class IntentionDetail {
  IntentionDetail({
    this.amount,
    this.currency,
    this.billingData,
  });

  IntentionDetail.fromJson(dynamic json) {
    amount = json['amount'];

    currency = json['currency'];
    billingData = json['billing_data'] != null
        ? BillingData.fromJson(json['billing_data'])
        : null;
  }

  num? amount;

  String? currency;
  BillingData? billingData;
}

class BillingData {
  BillingData({
    this.apartment,
    this.floor,
    this.firstName,
    this.lastName,
    this.street,
    this.building,
    this.phoneNumber,
    this.shippingMethod,
    this.city,
    this.country,
    this.state,
    this.email,
    this.postalCode,
  });

  BillingData.fromJson(dynamic json) {
    apartment = json['apartment'];
    floor = json['floor'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    street = json['street'];
    building = json['building'];
    phoneNumber = json['phone_number'];
    shippingMethod = json['shipping_method'];
    city = json['city'];
    country = json['country'];
    state = json['state'];
    email = json['email'];
    postalCode = json['postal_code'];
  }

  String? apartment;
  String? floor;
  String? firstName;
  String? lastName;
  String? street;
  String? building;
  String? phoneNumber;
  String? shippingMethod;
  String? city;
  String? country;
  String? state;
  String? email;
  String? postalCode;
}

class PaymentKeys {
  PaymentKeys({
    this.integration,
    this.key,
    this.gatewayType,
    this.iframeId,
    this.orderId,
    this.redirectionUrl,
    this.saveCard,
  });

  PaymentKeys.fromJson(dynamic json) {
    integration = json['integration'];
    key = json['key'];
    gatewayType = json['gateway_type'];
    iframeId = json['iframe_id'];
    orderId = json['order_id'];
    redirectionUrl = json['redirection_url'];
    saveCard = json['save_card'];
  }

  num? integration;
  String? key;
  String? gatewayType;
  dynamic iframeId;
  num? orderId;
  String? redirectionUrl;
  bool? saveCard;
}
