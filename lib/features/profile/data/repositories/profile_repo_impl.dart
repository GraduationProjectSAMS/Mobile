import '../../domain/repositories/profile_repo.dart';
import '../data_sources/profile_remote_repo.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteRepo remoteRepo;

  ProfileRepoImpl(this.remoteRepo);

  // Implement repository methods here
}
