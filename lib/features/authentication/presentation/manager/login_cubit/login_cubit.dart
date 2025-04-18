import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/authentication/domain/use_case/login_with_email_and_password_use_case.dart';

import '../../../domain/entity/login_entity.dart';
import '../../../domain/use_case/send_google_token_to_back_end_use_case.dart';
import '../../../domain/use_case/sign_in_with_google_use_case.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit(
      this._loginWithEmailAndPasswordUseCase, this._signInWithGoogleUseCase,

      this._sendGoogleTokenToBackEndUseCase)
      : super(LoginInitial());
  final LoginWithEmailAndPasswordUseCase _loginWithEmailAndPasswordUseCase;

  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SendGoogleTokenToBackEndUseCase _sendGoogleTokenToBackEndUseCase ;

  final formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';

  Future<void> loginWithEmailAndPassword() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      emit(LoginLoading());
      final result = await _loginWithEmailAndPasswordUseCase.call(
        email: email,
        password: password,
      );
      result.fold(
        (failure) => emit(LoginError(failure.errorMessage)),
        (token) => emit(LoginSuccess(token)),
      );
    }
  }

  void saveEmail(String? value) {
    email = value ?? "";
  }

  void savePassword(String? value) {
    password = value ?? "";
  }

  Future<void> signInWithGoogle() async {
    emit(LoginLoading());
    final result = await _signInWithGoogleUseCase.call();
    result.fold(
      (failure) => emit(LoginError(failure.errorMessage)),
      (token) async{
        await sendGoogleTokenToBackEnd(token);
      },
    );
  }
  Future<void> sendGoogleTokenToBackEnd(String googleToken) async {

    final result = await _sendGoogleTokenToBackEndUseCase.call(googleToken: googleToken);
    result.fold(
      (failure) => emit(LoginError(failure.errorMessage)),
      (loginEntity) => emit(LoginSuccess(loginEntity)),
    );
  }
}
