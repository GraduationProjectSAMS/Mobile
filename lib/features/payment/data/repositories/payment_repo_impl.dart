import '../../domain/repositories/payment_repo.dart';
import '../data_sources/payment_remote_repo.dart';

class PaymentRepoImpl implements PaymentRepo {
  final PaymentRemoteRepo remoteRepo;

  PaymentRepoImpl(this.remoteRepo);

// Implement repository methods here
}
