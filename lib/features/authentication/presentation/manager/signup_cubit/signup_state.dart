part of 'signup_cubit.dart';

@immutable
sealed class SignupStates {}

final class SignupInitial extends SignupStates {}

final class SignupLoading extends SignupStates {}

final class SignupSuccess extends SignupStates {
  final LoginEntity entity;

  SignupSuccess(this.entity);
}

final class SignupError extends SignupStates {
  final String error;

  SignupError(this.error);
}
