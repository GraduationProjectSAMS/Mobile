import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/features/orders/presentation/widgets/orders_item.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';
import '../../domain/entities/order_entity.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.ordersList});

  final List<OrderEntity> ordersList;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: ordersList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.gridCount - 1,
          mainAxisExtent: 260.sp,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (BuildContext context, int index) => GideItemAnimation(
          index: index,
          columnCount: context.gridCount,
          child: OrdersItem(
            orderEntity: ordersList[index],
          ),
        ),
      ),
    );
  }
}
