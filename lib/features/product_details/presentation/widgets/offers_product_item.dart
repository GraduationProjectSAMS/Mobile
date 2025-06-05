import 'package:dartz/dartz.dart' show Either;
import 'package:flutter/material.dart';
import 'package:graduation_project/core/config/extension/extension.dart';
import 'package:graduation_project/core/utilities/resources/app_constants.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/core/widgets/app_api_error_widget.dart';
import 'package:graduation_project/core/widgets/my_cached_network_image.dart';
import 'package:graduation_project/features/home/domain/entities/offer_products_entity.dart';
import 'package:graduation_project/features/home/domain/entities/product_entity.dart';
import 'package:graduation_project/features/product_details/presentation/screens/product_details_screen.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/routes/app_route.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/utilities/functions/my_toast.dart';
import '../../../../core/utilities/services/overlay_loading_service.dart';
import '../../../home/domain/use_cases/get_offer_by_id_use_case.dart';
import '../../../home/domain/use_cases/get_product_by_id_use_case.dart';

class OffersProductItem extends StatefulWidget {
  const OffersProductItem({super.key});

  @override
  State<OffersProductItem> createState() => _OffersProductItemState();
}

class _OffersProductItemState extends State<OffersProductItem> {
  ProductEntity? productEntity;

  final getOfferProductsUseCase = getIt.get<GetOfferByIdUseCase>();
  late Future<Either<Failure, ProductEntity>> _offersFuture;
  final _getProductByIdUseCase = getIt.get<GetProductByIdUseCase>();

  Future<void> _getProductById(int id) async {
    OverlayLoadingService().showOverlay(context);
    final result = await _getProductByIdUseCase.call(id);
    result.fold(
      (failure) {
        OverlayLoadingService().hideOverlay();
        showAdaptiveToast(
            context: context,
            msg: failure.errorMessage,
            state: ToastStates.error);
      },
      (product) {
        OverlayLoadingService().hideOverlay();
        context.navigateTo(
            pageName: AppRoutes.productDetails,
            arguments: (entity: product, context: null));
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (productEntity != null) return;
    final arg = context.productDetailsArgs;
    productEntity = arg.entity;

    // Initialize the future when we have the product entity
    if (productEntity?.type == AppConstants.offers) {
      _offersFuture = _getOfferById(productEntity!.id);
    }
  }

  Future<Either<Failure, ProductEntity>> _getOfferById(int id) async {
    return getOfferProductsUseCase.call(id);
  }

  Widget _buildOffersColumn(
      List<OfferProductsEntity> offersProducts, bool isLoading) {
    return Skeletonizer(
      enabled: isLoading,
      child: Column(
        children: offersProducts
            .map((e) => ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: EdgeInsets.zero,
                  leading: MyCachedNetworkImage(
                      isOval: true,
                      imageUrl: e.imageUrl,
                      width: 70.sp,
                      height: 70.sp,
                      fit: BoxFit.fill),
                  title: Text(e.name,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text('EGP ${e.price}',
                      style: const TextStyle(
                          color: Colors.green, fontWeight: FontWeight.bold)),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () => _getProductById(e.id),
                ))
            .toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (productEntity?.type != AppConstants.offers) {
      return const SizedBox(); // or some placeholder widget
    }

    return FutureBuilder<Either<Failure, ProductEntity>>(
      future: _offersFuture,
      builder: (context, snapshot) {
        List<OfferProductsEntity> offersProducts = [];

        if (snapshot.hasError) {
          return AppApiErrorWidget(
            errorMessage: snapshot.error.toString(),
          );
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          offersProducts = offersProductWaiting;
          return _buildOffersColumn(offersProducts, true);
        } else if (snapshot.hasData) {
          return snapshot.data!.fold(
            (failure) => AppApiErrorWidget(
              errorMessage: failure.errorMessage,
            ),
            (product) {
              offersProducts = product.offerProducts;
              return _buildOffersColumn(offersProducts, false);
            },
          );
        }

        // Fallback for any other state
        return const SizedBox.shrink();
      },
    );
  }
}
