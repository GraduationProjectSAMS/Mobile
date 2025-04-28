import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graduation_project/features/profile/domain/use_cases/logout_form_google_use_case.dart';

import '../../../../../core/errors/server_failure.dart';
import '../../../domain/use_cases/logout_use_case.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit({
    required LogoutUseCase logoutUseCase,

  })  :
        _logoutUseCase = logoutUseCase,
        super(LogoutInitialState());
  final LogoutUseCase _logoutUseCase;

  Future<void> logout() async {
    emit(LogoutLoadingState());
    final result = await _logoutUseCase.call();
    result.fold(
      (failure) {
        emit(LogoutErrorState(failure as ServerFailure));
      },
      (success) => emit(LogoutSuccessState()),
    );
  }
}
