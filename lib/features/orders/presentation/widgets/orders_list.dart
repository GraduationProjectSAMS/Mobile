import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/services/size_config_service.dart';
import 'package:graduation_project/features/orders/presentation/widgets/orders_item.dart';

import '../../../../core/utilities/functions/staggered_animations.dart';
import '../../domain/entities/order_entity.dart';

class OrdersList extends StatelessWidget {
  const OrdersList({super.key, required this.ordersList});

  final List<OrderEntity> ordersList;

  int get test => SizeConfigService.isDesktop ? 2 : 1;

  @override
  Widget build(BuildContext context) {
    return AnimationLimiter(
      child: GridView.builder(
        itemCount: ordersList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: context.gridCount - test,
          mainAxisExtent: 250.sp,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
        ),
        itemBuilder: (_, int index) => GideItemAnimation(
          index: index,
          columnCount: context.gridCount - test,
          child: OrdersItem(
            orderEntity: ordersList[index],
          ),
        ),
      ),
    );
  }
}
