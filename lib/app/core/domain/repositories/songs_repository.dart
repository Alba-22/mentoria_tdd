import 'package:fpdart/fpdart.dart';

import '../entities/song_entity.dart';
import '../errors/failures.dart';

abstract class SongsRepository {
  Future<Either<Failure, List<SongEntity>>> getRecommendedSongs();
}
