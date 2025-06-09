import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:graduation_project/features/authentication/domain/entity/login_entity.dart';

import '../../../domain/use_case/reset_password_use_case.dart';
import '../../../domain/use_case/send_reset_password_otp_use_case.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({
    required SendResetPasswordOtpUseCase sendResetPasswordOtpUseCase,
    required ResetPasswordUseCase resetPasswordUseCase,
  })  : _resetPasswordUseCase = resetPasswordUseCase,
        _sendResetPasswordOtpUseCase = sendResetPasswordOtpUseCase,
        super(ForgetPasswordInitial());
  final SendResetPasswordOtpUseCase _sendResetPasswordOtpUseCase;
  final ResetPasswordUseCase _resetPasswordUseCase;
  String email = '';
  String otp = '';
  String newPassword = '';

  final emilFormKey = GlobalKey<FormState>();
  final otpFormKey = GlobalKey<FormState>();

  void setEmail(String? email) {
    this.email = email ?? '';
  }

  void setOtp(String? otp) {
    this.otp = otp ?? '';
  }

  void setNewPassword(String? newPassword) {
    this.newPassword = newPassword ?? '';
  }

  Future<void> sendResetPasswordOtp() async {
    emit(ForgetPasswordLoading());
    final result = await _sendResetPasswordOtpUseCase(email: email);
    result.fold(
      (failure) => emit(ForgetPasswordErrorState(failure.errorMessage)),
      (_) => emit(ForgetPasswordGetTokenSuccess()),
    );
  }

  void onTapSendOtp() {
    if (emilFormKey.currentState!.validate()) {
      emilFormKey.currentState!.save();
      sendResetPasswordOtp();
    }
  }

  Future<void> resetPassword() async {
    emit(ForgetPasswordLoading());
    final result = await _resetPasswordUseCase(
      email: email,
      otp: otp,
      newPassword: newPassword,
    );
    result.fold(
      (failure) => emit(ForgetPasswordErrorState(failure.errorMessage)),
      (entity) => emit(ForgetPasswordResetSuccess(entity)),
    );
  }

  void onTapResetPassword() {
    if (otpFormKey.currentState!.validate()) {
      otpFormKey.currentState!.save();
      resetPassword();
    }
  }
}
