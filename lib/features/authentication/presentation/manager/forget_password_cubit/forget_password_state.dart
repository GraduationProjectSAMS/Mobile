part of 'forget_password_cubit.dart';

@immutable
sealed class ForgetPasswordState {}

final class ForgetPasswordInitial extends ForgetPasswordState {}

final class ForgetPasswordLoading extends ForgetPasswordState {}

final class ForgetPasswordGetTokenSuccess extends ForgetPasswordState {}

final class ForgetPasswordErrorState extends ForgetPasswordState {
  final String errorMessage;

  ForgetPasswordErrorState(this.errorMessage);
}

final class ForgetPasswordResetSuccess extends ForgetPasswordState {
  final LoginEntity entity;

  ForgetPasswordResetSuccess(this.entity);
}
