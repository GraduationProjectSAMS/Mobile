import '../../domain/repositories/add_product_repo.dart';
import '../data_sources/add_product_remote_repo.dart';

class AddProductRepoImpl implements AddProductRepo {
  final AddProductRemoteRepo remoteRepo;

  AddProductRepoImpl(this.remoteRepo);

// Implement repository methods here
}
