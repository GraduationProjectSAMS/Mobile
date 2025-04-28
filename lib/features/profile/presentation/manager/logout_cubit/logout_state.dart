part of 'logout_cubit.dart';

@immutable
sealed class LogoutStates {}

final class LogoutInitialState extends LogoutStates {}
final class LogoutLoadingState extends LogoutStates {}
final class LogoutSuccessState extends LogoutStates {

}
final class LogoutErrorState extends LogoutStates {
  final ServerFailure error;
  LogoutErrorState(this.error);
}

