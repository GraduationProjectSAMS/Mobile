import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:graduation_project/core/utilities/services/api_service.dart';

import '../../../features/authentication/data/data_sources/authentication_remote_repo_impl.dart';
import '../../../features/authentication/data/repo/authentication_repo_impl.dart';
import '../../../features/authentication/domain/use_case/login_with_email_and_password_use_case.dart';
import '../../../features/authentication/domain/use_case/sign_in_with_google_use_case.dart';
import '../../../features/authentication/domain/use_case/signup_with_gmail_use_case.dart';
import 'google_sign_in_service.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  /// Services
  getIt.registerLazySingleton<GoogleSignInService>(
      () => GoogleSignInService(GoogleSignIn()));
  getIt.registerLazySingleton<ApiService>(() => ApiService(Dio()));

  /// Repositories
  getIt.registerLazySingleton<AuthenticationRepoImpl>(() =>
      AuthenticationRepoImpl(AuthenticationRemoteRepoImpl(
          getIt.get<GoogleSignInService>(), getIt.get<ApiService>())));

  /// Use Cases
  getIt.registerLazySingleton<SignInWithGoogleUseCase>(
      () => SignInWithGoogleUseCase(getIt.get<AuthenticationRepoImpl>()));
  getIt.registerLazySingleton<SignupWithGmailUseCase>(
      () => SignupWithGmailUseCase(getIt.get<AuthenticationRepoImpl>()));
  getIt.registerLazySingleton<LoginWithEmailAndPasswordUseCase>(() =>
      LoginWithEmailAndPasswordUseCase(getIt.get<AuthenticationRepoImpl>()));
}
