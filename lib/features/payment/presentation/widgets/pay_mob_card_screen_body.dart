import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../domain/entities/pay_mob_entity.dart';
import '../manager/payment_cubit/payment_cubit.dart';

class PayMobCardScreenBody extends StatefulWidget {
  const PayMobCardScreenBody({super.key});

  @override
  State<PayMobCardScreenBody> createState() => _PayMobCardScreenBodyState();
}

class _PayMobCardScreenBodyState extends State<PayMobCardScreenBody> {
  late final WebViewController _controller;
  late final PaymentCubit _paymentCubit;
  late final PayMobEntity _payMobEntity;
  bool _hasLoaded = false;

  @override
  void initState() {
    super.initState();

    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: _onPageFinished,
        ),
      );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // grab your route arguments exactly once
    if (!_hasLoaded) {
      final args = ModalRoute.of(context)!.settings.arguments as ({
        PaymentCubit cubit,
        PayMobEntity payMobEntity
      });
      _paymentCubit = args.cubit;
      _payMobEntity = args.payMobEntity;

      final url = _buildPayMobUrl(_payMobEntity.clientSecretKey);
      Logger().i('Loading PayMob URL: $url');
      _controller.loadRequest(Uri.parse(url));

      _hasLoaded = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(controller: _controller);
  }

  void _onPageFinished(String url) {
    final uri = Uri.parse(url);
    if (uri.queryParameters['success'] == 'true') {
      _paymentCubit.createOrder();
    }
  }

  String _buildPayMobUrl(String clientSecretKey) {
    final publicKey = AppEndpoints.payMobPublicKey;
    return 'https://accept.paymob.com/unifiedcheckout/'
        '?publicKey=$publicKey'
        '&clientSecret=$clientSecretKey';
  }
}
