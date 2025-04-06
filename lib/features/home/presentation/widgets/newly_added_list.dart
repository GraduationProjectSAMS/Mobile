import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/home/presentation/widgets/product_item.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';

class NewlyAddedList extends StatelessWidget {
  const NewlyAddedList({super.key});

  @override
  Widget build(BuildContext context) {
    return  AnimationLimiter(
      child: SizedBox(
        height: 28.hR,
        child: ListView.separated(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) => ListItemAnimation(
            isHorizontal: true,
            index: index,
            child: ProductItem(
              height: 29.hR,
              width: 20.hR,
            ),
          ),
          separatorBuilder: (_, __) => SizedBox(
            width: 5,
          ),
          itemCount: 20,
        ),
      ),
    );
  }
}
