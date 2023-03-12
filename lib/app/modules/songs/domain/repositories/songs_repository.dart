import 'package:fpdart/fpdart.dart';

import 'package:tunefy/app/core/domain/entities/song_entity.dart';
import 'package:tunefy/app/core/domain/errors/failures.dart';

abstract class SongsRepository {
  Future<Either<Failure, List<SongEntity>>> getRecommendedSongs();
  Future<Either<Failure, List<SongEntity>>> getSongsByText(String text);
}
