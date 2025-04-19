import 'package:flutter/material.dart';
import 'package:graduation_project/core/utilities/services/size_config_service.dart';

extension NavigateToExtension on BuildContext {
  Future navigateTo({required String pageName, Object? arguments}) async =>
      Navigator.of(this).pushNamed(pageName, arguments: arguments);
}

extension NavigatorPopExtension on BuildContext {
  pop({bool result = false}) => Navigator.of(this).pop(result);
}

extension NavigateReplacementExtension on BuildContext {
  navigateAndRemoveUntil({required String pageName, Object? arguments}) =>
      Navigator.of(this).pushNamedAndRemoveUntil(
          pageName, (Route<dynamic> route) => false,
          arguments: arguments);
}

extension PopUntilSpecificRouteExtension on BuildContext {
  popUntilSpecificRoute({required String pageName}) =>
      Navigator.of(this).popUntil(ModalRoute.withName(pageName));
}

extension GetResponsiveFont on num {
  double get sp => SizeConfigService.getResponsiveFontSize(toDouble());
}

extension GetHeightRatioFromScreen on num {
  double get hR => SizeConfigService.height * this / 100;
}

extension GetWidthRatioFromScreen on num {
  double get wR => SizeConfigService.width * this / 100;
}
extension GetGridAdptiveChildrenCount on BuildContext{
  int get gridCount =>SizeConfigService.setListCount(this);
}