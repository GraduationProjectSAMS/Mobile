import 'package:flutter/material.dart';

import '../../config/routes/app_route.dart';

String getHeroTag(BuildContext context, String baseTag) {
  final routeName = ModalRoute.of(context)?.settings.name;
  final isHeroAllowed = routeName == AppRoutes.productDetails ||
      routeName == AppRoutes.homeLayout;

  return isHeroAllowed ? baseTag : 'not_hero_$baseTag';
}
