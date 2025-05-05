part of 'profile_cubit.dart';

@immutable
sealed class ProfileStates {}

final class ProfileInitialState extends ProfileStates {}

final class ProfileLoadingState extends ProfileStates {}

final class ProfileSuccessState extends ProfileStates {
  final UserEntity userEntity;

  ProfileSuccessState(this.userEntity);
}

final class ProfileErrorState extends ProfileStates {
  final String error;

  ProfileErrorState(this.error);
}
