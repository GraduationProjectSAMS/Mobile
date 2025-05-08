import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:graduation_project/core/utilities/resources/app_endpoints.dart';
import 'package:logger/logger.dart';

import '../../domain/entities/pay_mob_entity.dart';


class PayMobCardScreenBody extends StatelessWidget {
  const PayMobCardScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieving the arguments passed to the screen
    final arguments = ModalRoute.of(context)?.settings.arguments as PayMobEntity;

    // Extracting the clientSecretKey from the arguments
    final paymentToken = arguments.clientSecretKey;
    final publicKey = AppEndpoints.payMobPublicKey; // You might want to get this from your environment or endpoint configuration.

    // Constructing the PayMob URL dynamically with the paymentToken and publicKey
    final payMobUrl = 'https://accept.paymob.com/unifiedcheckout/?publicKey=$publicKey&clientSecret=$paymentToken';
Logger().i('PayMob URL: $payMobUrl');
    return InAppWebView(
      initialUrlRequest: URLRequest(
        url:WebUri(payMobUrl),
      ),
      onWebViewCreated: (InAppWebViewController controller) {
        // Inject JavaScript to change button text and color
        controller.addJavaScriptHandler(
            handlerName: 'changeButtonColor',
            callback: (args) {
              controller.evaluateJavascript(source: """
                // Find the button by ID
                var payButton = document.getElementById('pay-button');
                if (payButton) {
                  // Change the background color to green
                  payButton.style.backgroundColor = 'green';  // Change button color to green
                  // Change the opacity to make it visible
                  payButton.style.opacity = '1';  // Ensure the button is visible
                  // Change the button text to 'Pay Now'
                  payButton.querySelector('span').innerText = 'Pay Now';  // Change button text
                  // Enable the button
                  payButton.removeAttribute('disabled');  // Enable the button
                }
              """);
            });
      },
      onLoadStart: (InAppWebViewController controller, Uri? url) {
        print('Started loading: $url');
      },
      onLoadStop: (InAppWebViewController controller, Uri? url) {
        print('Finished loading: $url');
        // Execute JavaScript once the page is fully loaded to change button styles
        controller.evaluateJavascript(source: """
            var payButton = document.getElementById('pay-button');
            if (payButton) {
              // Change the background color to green
              payButton.style.backgroundColor = 'green';  // Change button color to green
              // Change the opacity to make it visible
              payButton.style.opacity = '1';  // Ensure the button is visible
              // Change the button text to 'Pay Now'
              payButton.querySelector('span').innerText = 'Pay Now';  // Change button text
              // Enable the button
              payButton.removeAttribute('disabled');  // Enable the button
            }
          """);
      },
    );
  }
}

