import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/functions/show_dialog.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';

import '../../../app/my_app.dart';
import '../functions/app_logout.dart';
import '../resources/app_constants.dart';
import 'cache_service.dart';

class DioInterceptor extends Interceptor {
  const DioInterceptor();
static bool _sessionDialogShowing = false;
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    CacheService.token = CacheService.getData(key: AppConstants.token);

    if (CacheService.token != null) {
      options.headers['Authorization'] = 'Bearer ${CacheService.token}';
    }
    super.onRequest(options, handler);


  }
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    CacheService.token = CacheService.getData(key: AppConstants.token);
    if (err.response?.statusCode == AppConstants.unAuthorizedCode && CacheService.token!=null ) {
      _showSessionExpiredDialogOnce();

    }
    super.onError(err, handler);
  }
  void _showSessionExpiredDialogOnce() {
    if (_sessionDialogShowing) return;        // ← already showing, bail out
    _sessionDialogShowing = true;

    final context =MyApp. navigatorKey.currentState?.overlay?.context;
    if (context == null) {
      _sessionDialogShowing = false;
      return;
    }

    showAppDialog(
      context: context,
     dismissible: false,
       child: const TokenExpiredDialogContent(),
    ).then((_) {
      // reset the flag once the dialog is dismissed
      _sessionDialogShowing = false;
    });
  }
}

class TokenExpiredDialogContent extends StatelessWidget {
  const TokenExpiredDialogContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(
            Icons.warning_amber_outlined,
            size: 48,
            color: Colors.amber,
          ),
          const SizedBox(height: 16),
          Text(
            'Session Expired',
            style: AppStyles.textStyle16
          ),
          const SizedBox(height: 16),
          const Text(
            'Your session has expired. Please log in again to continue.',
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          MyButton(
            onPressed: () async {
             await appLogout();
             if(!context.mounted) return;
              context.navigateAndRemoveUntil(
                 pageName: AppRoutes.login,
              );
            },
            text: 'Log In Again',
          ),
        ],
      ),
    );
  }
}