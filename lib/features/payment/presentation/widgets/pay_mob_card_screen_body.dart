import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';
import 'package:logger/logger.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../domain/entities/pay_mob_entity.dart';

class PayMobCardScreenBody extends StatefulWidget {
  const PayMobCardScreenBody({super.key});

  @override
  State<PayMobCardScreenBody> createState() => _PayMobCardScreenBodyState();
}

class _PayMobCardScreenBodyState extends State<PayMobCardScreenBody> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            print('Started loading: $url');
          },
          onPageFinished: (String url) {
            print('Finished loading: $url');
            _controller.runJavaScript("""
              var payButton = document.getElementById('pay-button');
              if (payButton) {
                payButton.style.backgroundColor = 'green';
                payButton.style.opacity = '1';
                var span = payButton.querySelector('span');
                if (span) span.innerText = 'Pay Now';
                payButton.removeAttribute('disabled');
              }
            """);
          },
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as PayMobEntity;
    final paymentToken = arguments.clientSecretKey;
    final publicKey = AppEndpoints.payMobPublicKey;
    final payMobUrl =
        'https://accept.paymob.com/unifiedcheckout/?publicKey=$publicKey&clientSecret=$paymentToken';
    Logger().i('PayMob URL: $payMobUrl');

    _controller.loadRequest(Uri.parse(payMobUrl));

    return WebViewWidget(controller: _controller);
  }
}
