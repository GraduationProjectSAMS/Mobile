import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/add_product/presentation/manager/add_product_cubit.dart';
import '../widgets/add_product_screen_body.dart';

class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductCubit(),
      child: const Scaffold(
        body: AddProductScreenBody(),
      ),
    );
  }
}
