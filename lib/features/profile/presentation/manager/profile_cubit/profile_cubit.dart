import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/profile/domain/entities/user_entity.dart';

import '../../../domain/use_cases/get_profile_data_use_case.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileStates> {
  ProfileCubit(this._getUserDataUseCase) : super(ProfileInitialState());
  final GetProfileDataUseCase _getUserDataUseCase;
  UserEntity userEntity = UserEntity.loading();

  Future<void> getUserData() async {
    emit(ProfileLoadingState());
    final result = await _getUserDataUseCase.getProfileData();
    result.fold(
      (failure) {
        emit(ProfileErrorState(failure.errorMessage));
      },
      (user) {
        userEntity = user;
        emit(ProfileSuccessState(user));
      },
    );
  }
}
