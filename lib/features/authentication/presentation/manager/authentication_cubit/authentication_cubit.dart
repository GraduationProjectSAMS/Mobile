import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/domain/entity/login_entity.dart';

import '../../../domain/use_case/login_with_email_and_password_use_case.dart';
import '../../../domain/use_case/signup_with_gmail_use_case.dart';

part 'authentication_state.dart';

class AuthenticationCubit extends Cubit<AuthenticationStates> {
  AuthenticationCubit({
    required LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase,
    required SignupWithGmailUseCase signupWithGmailUseCase,
  })  : _loginWithEmailAndPasswordUseCase = loginWithEmailAndPasswordUseCase,
        _signupWithGmailUseCase = signupWithGmailUseCase,
        super(AuthenticationInitialState());
  final LoginWithEmailAndPasswordUseCase _loginWithEmailAndPasswordUseCase;
  final SignupWithGmailUseCase _signupWithGmailUseCase;
  final signupFormKey = GlobalKey<FormState>();
  final loginFormKey = GlobalKey<FormState>();
  String loginEmail = '';
  String loginPassword = '';
  String signupName = '';
  String signupEmail = '';
  String signupPassword = '';

  void setLoginEmail(String? value) {
    loginEmail = value ?? "";
  }

  void setLoginPassword(String? value) {
    loginPassword = value ?? "";
  }

  void setSignupName(String? value) {
    signupName = value ?? "";
  }

  void setSignupEmail(String? value) {
    signupEmail = value ?? "";
  }

  void setSignupPassword(String? value) {
    signupPassword = value ?? "";
  }

  Future<void> loginWithEmailAndPassword() async {
    if (loginFormKey.currentState!.validate()) {
      emit(AuthenticationLoadingState());
      final result = await _loginWithEmailAndPasswordUseCase.call(
        email: loginEmail,
        password: loginPassword,
      );
      result.fold(
        (failure) => emit(AuthenticationErrorState(failure.errorMessage)),
        (loginEntity) => emit(AuthenticationSuccessState(loginEntity)),
      );
    }
  }
}
