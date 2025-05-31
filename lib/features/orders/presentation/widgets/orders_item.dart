import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';
import 'package:graduation_project/features/orders/presentation/widgets/order_details_status_bar.dart';
import 'package:graduation_project/features/payment/presentation/widgets/payment_method.dart';

import '../../../../core/utilities/functions/date_time_format.dart';

class OrdersItem extends StatelessWidget {
  const OrdersItem({super.key, required this.orderEntity});

  final OrderEntity orderEntity;

  List<IconData> get icons => [
        Icons.shopping_bag,
        PaymentMethod.fromValue(orderEntity.paymentMethod).icon,
        Icons.location_on,
      ];
  static const colors = [
    Colors.orange,
    Colors.green,
    Colors.red,
  ];
  static const hints = [
    'Price',
    'Ordered At',
    'Delivery Date',
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          context.navigateTo(
              pageName: AppRoutes.orderDetails, arguments: orderEntity.orderId);
        },
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Order ID: ${orderEntity.hashId}',
                  style: AppStyles.textStyle20,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: List.generate(
                  3,
                  (index) {
                    final titles = [
                      OrderStatus.fromValue(orderEntity.orderStatus).label ,
                      PaymentMethod.fromValue(orderEntity.paymentMethod).label,
                      orderEntity.shippingAddress,
                    ];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Row(
                        children: [
                          Icon(
                            icons[index],
                            color: colors[index],
                            size: 20.sp,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                              child: Text(
                                  maxLines: 1,
                                  textAlign: TextAlign.end,
                                  titles[index],
                                  style: AppStyles.defaultStyle)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: Row(
                  children: List.generate(3, (index) {
                    final titles = [
                      '${num.tryParse(orderEntity.totalPrice)?.toStringAsFixed(2)} EGP',
                      formatDateTime(orderEntity.orderDate),
                      orderEntity.deliveryDate,
                    ];
                    return Expanded(
                        child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: index == 1 ? 5 : 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              hints[index],
                              style: AppStyles.textStyle12
                                  .copyWith(fontWeight: FontWeight.w600),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Flexible(
                            child: Text(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                titles[index],
                                style: AppStyles.defaultStyle),
                          ),
                        ],
                      ),
                    ));
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
