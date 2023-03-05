import 'package:fpdart/fpdart.dart';

import '../errors/failures.dart';

abstract class Usecase<Output, Input> {
  Future<Either<Failure, Output>> call(Input params);
}
