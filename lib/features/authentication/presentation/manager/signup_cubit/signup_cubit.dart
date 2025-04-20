import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/login_entity.dart';
import '../../../domain/use_case/send_google_token_to_back_end_use_case.dart';
import '../../../domain/use_case/sign_in_with_google_use_case.dart';
import '../../../domain/use_case/signup_with_gmail_use_case.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit(this._signupWithGmailUseCase, this._signInWithGoogleUseCase,
      this._sendGoogleTokenToBackEndUseCase)
      : super(SignupInitial());
  final SignupWithGmailUseCase _signupWithGmailUseCase;
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SendGoogleTokenToBackEndUseCase _sendGoogleTokenToBackEndUseCase;

  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  Future<void> signup() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();

      emit(SignupLoading());
      final response = await _signupWithGmailUseCase.call(
        name: name,
        email: email,
        password: password,
      );
      response.fold(
        (failure) => emit(SignupError(failure.errorMessage)),
        (loginEntity) => emit(SignupSuccess(loginEntity)),
      );
    }
  }

  void setName(String? value) {
    name = value ?? '';
  }

  void setEmail(String? value) {
    email = value ?? '';
  }

  void setPassword(String? value) {
    password = value ?? '';
  }

  Future<void> signInWithGoogle() async {
    emit(SignupLoading());
    final result = await _signInWithGoogleUseCase.call();
    result.fold(
      (failure) => emit(SignupError(failure.errorMessage)),
      (token) async {
        await sendGoogleTokenToBackEnd(token);
      },
    );
  }

  Future<void> sendGoogleTokenToBackEnd(String googleToken) async {
    final result =
        await _sendGoogleTokenToBackEndUseCase.call(googleToken: googleToken);
    result.fold(
      (failure) => emit(SignupError(failure.errorMessage)),
      (loginEntity) => emit(SignupSuccess(loginEntity)),
    );
  }
}
