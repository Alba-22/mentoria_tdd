import 'package:fpdart/fpdart.dart';

import '../entities/song_entity.dart';
import '../entities/usecase.dart';
import '../errors/failures.dart';
import '../repositories/songs_repository.dart';

class GetRecommendedSongsUsecase implements Usecase<List<SongEntity>, Unit> {
  final SongsRepository _repository;

  GetRecommendedSongsUsecase(this._repository);

  @override
  Future<Either<Failure, List<SongEntity>>> call(Unit params) async {
    return await _repository.getRecommendedSongs();
  }
}
