import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/resources/app_assets.dart';

import '../../../../core/utilities/resources/app_constants.dart';
import '../../../../core/utilities/services/cache_service.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  _SplashViewBodyState createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> {
  @override
  void initState() {
    super.initState();
    _startSplashDelay(); // call your extracted method
  }

  void _startSplashDelay() {
    Future.delayed(const Duration(seconds: 1), _goToNext);
  }

  void _goToNext() {
    CacheService.token = CacheService.getData(key: AppConstants.token);
    final pageName =
        CacheService.token != null ? AppRoutes.homeLayout : AppRoutes.login;
    context.navigateAndRemoveUntil(pageName: pageName);
    // or: Navigator.of(context).pushReplacementNamed('/home');
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        AppAssets.appLogo,
        width: 300,
        height: 300,
        fit: BoxFit.cover,
      ),
    );
  }
}
// make sum method to calculate the sum of two numbers
// return Column(
//   children: [
//     //
//     const FractionallySizedBox(),
//     // make grid paper
//     const GridPaper(),
//     const LongPressDraggable(
//       feedback: Text('data'),
//       child: Text('data'),
//     ),
//     const ModalBarrier(),
//     NavigationBar(destinations: const []),
//
//     /// to behave as row then coulam
//     const OverflowBar(),
//     // to make the child overflow the parent
//     const OverflowBox(),
//     // same as container but with decoration
//     const PhysicalModel(
//       color: Colors.red,
//     ),
//     const PhysicalShape(
//       clipper: ShapeBorderClipper(shape: RoundedRectangleBorder()),
//       color: Colors.red,
//     ),
//
//     // RangeSlider(values: values, onChanged: onChanged)
//     const TabPageSelector(),
//   ],
// );
