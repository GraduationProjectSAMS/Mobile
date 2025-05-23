import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/services/size_config_service.dart';
import 'package:graduation_project/features/orders/presentation/widgets/orders_item.dart';
import 'package:logger/logger.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';
import '../../domain/entities/order_entity.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.ordersList});

  final List<OrderEntity> ordersList;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      final gridCount = constraints.maxWidth.gridCount - 1;

      return AnimationLimiter(
        child: GridView.builder(
          itemCount: ordersList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: gridCount,
            mainAxisExtent: 250.sp,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
          ),
          itemBuilder: (_, int index) => GideItemAnimation(
            index: index,
            columnCount: gridCount,
            child: OrdersItem(
              orderEntity: ordersList[index],
            ),
          ),
        ),
      );
    });
  }
}
