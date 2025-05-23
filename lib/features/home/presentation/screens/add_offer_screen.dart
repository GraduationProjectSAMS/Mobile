import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/add_offer_cubit/add_offer_cubit.dart';
import '../widgets/add_offer_screen_body.dart';

class AddOfferScreen extends StatelessWidget {
  const AddOfferScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddOfferCubit(),
      child: const Scaffold(
        body: AddOfferScreenBody(),
      ),
    );
  }
}
