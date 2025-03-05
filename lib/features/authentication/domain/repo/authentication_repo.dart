
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class AuthenticationRepo{
Future<Either<Failure,String>> signInWithGoogle();
}
