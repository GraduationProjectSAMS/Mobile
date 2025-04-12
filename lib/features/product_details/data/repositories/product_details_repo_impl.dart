import '../../domain/repositories/product_details_repo.dart';
import '../data_sources/product_details_remote_repo.dart';

class ProductDetailsRepoImpl implements ProductDetailsRepo {
  final ProductDetailsRemoteRepo remoteRepo;

  ProductDetailsRepoImpl(this.remoteRepo);

// Implement repository methods here
}
