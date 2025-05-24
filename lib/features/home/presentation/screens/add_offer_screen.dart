import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/home/data/repositories/home_repo_impl.dart';
import 'package:graduation_project/features/home/domain/use_cases/add_offer_use_case.dart';

import '../../../../core/utilities/services/dependency_injection_service.dart';
import '../manager/add_offer_cubit/add_offer_cubit.dart';
import '../widgets/add_offer_screen_body.dart';

class AddOfferScreen extends StatelessWidget {
  const AddOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOfferCubit(
        addOfferUseCase: AddOfferUseCase(getIt.get<HomeRepoImpl>()),
      ),
      child: const Scaffold(
        body: AddOfferScreenBody(),
      ),
    );
  }
}
