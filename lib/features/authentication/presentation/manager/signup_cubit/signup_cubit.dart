import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entity/login_entity.dart';
import '../../../domain/use_case/signup_with_gmail_use_case.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupStates> {
  SignupCubit(this._signupWithGmailUseCase) : super(SignupInitial());
  final SignupWithGmailUseCase _signupWithGmailUseCase;
  final key = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  Future<void> signup() async {
    emit(SignupLoading());
    print("email: $email");
    print("password: $password");
    print("name: $name");
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

  void setName(String? value) {
    name = value ?? "";
  }

  void setEmail(String? value) {
    email = value ?? "";
  }

  void setPassword(String? value) {
    password = value ?? "";
  }

  void onTapSignUp() {
    if (key.currentState!.validate()) {
      key.currentState!.save();
      signup();
    }
  }
}
