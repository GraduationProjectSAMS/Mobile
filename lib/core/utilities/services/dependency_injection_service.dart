import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../features/authentication/data/data_sources/authentication_remote_repo_impl.dart';
import '../../../features/authentication/data/repo/authentication_repo_impl.dart';
import '../../../features/authentication/domain/use_case/sign_in_with_google_use_case.dart';
import 'google_sign_in_service.dart';



final GetIt getIt = GetIt.instance;

void setupDependencies() {
  /// Services
  getIt.registerLazySingleton<GoogleSignInService>(
          () => GoogleSignInService(GoogleSignIn()));

  /// Repositories
  getIt.registerLazySingleton<AuthenticationRepoImpl>(
          () => AuthenticationRepoImpl(
          AuthenticationRemoteRepoImpl(getIt.get<GoogleSignInService>())));

  /// Use Cases
  getIt.registerLazySingleton<SignInWithGoogleUseCase>(
          () => SignInWithGoogleUseCase(getIt.get<AuthenticationRepoImpl>()));
}

