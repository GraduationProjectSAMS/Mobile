part of 'login_cubit.dart';

@immutable
sealed class LoginStates {}

final class LoginInitial extends LoginStates {}

final class LoginLoading extends LoginStates {}

final class LoginSuccess extends LoginStates {
  final LoginEntity entity;

  LoginSuccess(this.entity);
}

final class LoginError extends LoginStates {
  final String error;

  LoginError(this.error);
}
