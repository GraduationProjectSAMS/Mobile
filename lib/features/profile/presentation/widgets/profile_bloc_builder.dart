import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/core/widgets/app_api_error_widget.dart';
import 'package:graduation_project/features/profile/presentation/manager/profile_cubit/profile_cubit.dart';
import 'package:graduation_project/features/profile/presentation/widgets/profile_image_and_name.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileStates>(
      builder: (context, state) {
        final cubit = BlocProvider.of<ProfileCubit>(context);
        if (state is ProfileErrorState) {
          return AppApiErrorWidget(errorMessage: state.error);
        }
        return ProfileImageAndName(
          userEntity: cubit.userEntity,
          isLoading: state is ProfileLoadingState,
        );
      },
    );
  }
}
