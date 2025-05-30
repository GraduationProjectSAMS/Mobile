import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/utilities/services/dependency_injection_service.dart';
import 'package:graduation_project/features/add_product/domain/use_cases/add_product_use_case.dart';
import 'package:graduation_project/features/add_product/presentation/manager/add_product_cubit.dart';

import '../../data/repositories/add_product_repo_impl.dart';
import '../widgets/add_product_screen_body.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(
          addProductUseCase: AddProductUseCase(
        getIt.get<AddProductRepoImpl>(),
      )),
      child: const Scaffold(
        body: AddProductScreenBody(),
      ),
    );
  }
}
