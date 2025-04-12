import '../../domain/repositories/home_repo.dart';
import '../data_sources/home_remote_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteRepo remoteRepo;

  HomeRepoImpl(this.remoteRepo);

// Implement repository methods here
}
