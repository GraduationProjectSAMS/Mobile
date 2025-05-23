import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/functions/app_logout.dart';
import 'package:graduation_project/core/utilities/functions/my_toast.dart';
import 'package:graduation_project/core/utilities/functions/show_dialog.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/resources/app_strings.dart';
import 'package:graduation_project/core/widgets/my_button_widget.dart';

import '../../../../core/utilities/resources/app_styles.dart';
import '../../../../core/widgets/height_sized_box.dart';
import '../manager/logout_cubit/logout_cubit.dart';

void showLogoutDialog(BuildContext context) {
  showAppDialog(
      context: context, child: ShowLogoutDialogContent(context: context));
}

class ShowLogoutDialogContent extends StatelessWidget {
  const ShowLogoutDialogContent({super.key, required this.context});

  final BuildContext context;

  @override
  Widget build(BuildContext _) {
    return BlocProvider.value(
      value: context.read<LogoutCubit>(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            radius: 25.sp,
            backgroundColor: Colors.red,
            child: Icon(
              Icons.close,
              color: Colors.white,
              size: 27.sp,
            ),
          ),
          const HeightSizedBox(height: 3),
          Text(
            'Are you sure you want to logout?',
            textAlign: TextAlign.center,
            style: AppStyles.textStyle16,
          ),
          const SizedBox(height: 20),
          BlocConsumer<LogoutCubit, LogoutStates>(
              builder: (context, state) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    if (state is LogoutLoadingState)
                      const Center(
                        child: CircularProgressIndicator(),
                      )
                    else ...[
                      MyTextButton(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        text: AppStrings.cancel,
                      ),
                      MyTextButton(
                        onTap: () {
                          context.read<LogoutCubit>().logout();
                        },
                        text: AppStrings.logout,
                      ),
                    ]
                  ],
                );
              },
              listener: listener)
        ],
      ),
    );
  }

  void listener(BuildContext context, LogoutStates state) async {
    if (shouldForceLogout(state)) {
      await appLogout();
      if (!context.mounted) return;
      context.navigateAndRemoveUntil(pageName: AppRoutes.login);
    } else if (state is LogoutErrorState) {
      showAdaptiveToast(
          msg: state.error.errorMessage,
          state: ToastStates.error,
          context: context);
    }
  }

  bool shouldForceLogout(LogoutStates state) {
    if (state is LogoutSuccessState) {
      return true;
    }

    if (state is LogoutErrorState) {
      final statusCode = state.error.statusCode;
      return statusCode == AppConstants.unAuthorizedCode ||
          statusCode == AppConstants.connectionTimeoutCode;
    }

    return false;
  }
}
