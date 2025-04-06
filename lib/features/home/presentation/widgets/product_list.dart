import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/services/size_config_service.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';

class ProductList extends StatelessWidget {
  const ProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 2)),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) =>
          Skeletonizer(
            enabled: snapshot.connectionState != ConnectionState.done,
            child: AnimationLimiter(
                    child: GridView.builder(
            padding: EdgeInsets.symmetric(horizontal: 10),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: SizeConfigService.setListCount(context),
              mainAxisExtent: 30.hR,

              crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (BuildContext context, int index) => GideItemAnimation(
                index: index,
                columnCount: SizeConfigService.setListCount(context),
                child: ProductItem()),
                    ),
                  ),
          ),
    );
  }
}
