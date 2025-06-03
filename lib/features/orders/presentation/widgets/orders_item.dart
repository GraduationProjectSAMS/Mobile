import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/config/routes/app_route.dart';
import 'package:graduation_project/core/utilities/functions/date_time_format.dart';
import 'package:graduation_project/core/utilities/functions/my_toast.dart';
import 'package:graduation_project/core/utilities/resources/app_styles.dart';
import 'package:graduation_project/core/utilities/services/size_config_service.dart';
import 'package:graduation_project/features/orders/domain/entities/order_entity.dart';
import 'package:graduation_project/features/payment/presentation/widgets/payment_method.dart';

import '../manager/get_orders_cubit/get_orders_cubit.dart';
import 'order_status.dart';

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
    return BlocListener<GetOrdersCubit, GetOrdersStates>(
      listener: (context, state) {
        if (state is ChangeOrderStatusSuccess) {
          // Refresh orders
        } else if (state is ChangeOrderStatusError) {
          showAdaptiveToast(
              context: context, msg: state.error, state: ToastStates.error);
        }
      },
      child: Stack(
        children: [
          Card(
            color: Colors.white,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () {
                context.navigateTo(
                    pageName: AppRoutes.orderDetails,
                    arguments: orderEntity.orderId);
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
                    const SizedBox(height: 10),
                    Column(
                      children: List.generate(
                        3,
                        (index) {
                          final titles = [
                            orderEntity.currentStatus.label,
                            // Restore original status text
                            PaymentMethod.fromValue(orderEntity.paymentMethod)
                                .label,
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
                                    style: AppStyles.defaultStyle,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: index == 1 ? 5 : 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Text(
                                      hints[index],
                                      style: AppStyles.textStyle12.copyWith(
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                  const SizedBox(height: 5),
                                  Flexible(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      titles[index],
                                      style: AppStyles.defaultStyle,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (SizeConfigService.isDesktop)
            BlocBuilder<GetOrdersCubit, GetOrdersStates>(
              builder: (context, state) {
                final bool isLoading = state is ChangeOrderStatusLoading;
                return Align(
                  alignment: AlignmentDirectional.bottomEnd,
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 8, bottom: 20, right: 8),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton2<OrderStatus>(
                        isDense: true,
                        // Minimize size
                        customButton: isLoading
                            ? const SizedBox(
                                width: 16,
                                height: 16,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2,
                                ),
                              )
                            : Icon(
                                Icons.more_vert_outlined,
                                color: Colors.grey[700]!,
                                size: 23.sp,
                              ),
                        dropdownStyleData: DropdownStyleData(
                          maxHeight: 40.hR,
                          width: 160,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 8,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                        ),
                        menuItemStyleData: const MenuItemStyleData(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 12),
                        ),
                        items: _buildDropdownItems(),
                        onChanged: isLoading
                            ? null
                            : (newStatus) {
                                if (newStatus != null) {
                                  context
                                      .read<GetOrdersCubit>()
                                      .changeOrderStatus(
                                        orderId: orderEntity.orderId.toString(),
                                        statusId: newStatus.value,
                                        context: context,
                                      );
                                }
                              },
                      ),
                    ),
                  ),
                );
              },
            ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<OrderStatus>> _buildDropdownItems() {
    final currentIndex = orderEntity.currentStatus.index;

    return OrderStatus.values.asMap().entries.map((entry) {
      final index = entry.key;
      final status = entry.value;
      // Enable all statuses after the current status
      final isEnabled = index > currentIndex;

      return DropdownMenuItem<OrderStatus>(
        value: status,
        enabled: isEnabled,
        child: Text(
          status.label,
          style: TextStyle(
            color: isEnabled ? Colors.black : Colors.grey,
          ),
        ),
      );
    }).toList();
  }
}
