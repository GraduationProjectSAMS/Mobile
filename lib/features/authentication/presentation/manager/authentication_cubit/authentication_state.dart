part of 'authentication_cubit.dart';

@immutable
sealed class AuthenticationStates {}

final class AuthenticationInitialState extends AuthenticationStates {}

final class AuthenticationLoadingState extends AuthenticationStates {}

final class AuthenticationSuccessState extends AuthenticationStates {
  final LoginEntity entity;

  AuthenticationSuccessState(this.entity);
}

final class AuthenticationErrorState extends AuthenticationStates {
  final String error;

  AuthenticationErrorState(this.error);
}
