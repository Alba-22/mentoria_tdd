import 'package:fpdart/fpdart.dart';

import 'package:tunefy/app/core/domain/entities/song_entity.dart';
import 'package:tunefy/app/core/domain/entities/usecase.dart';
import 'package:tunefy/app/core/domain/errors/failures.dart';

import '../repositories/songs_repository.dart';

class GetRecommendedSongsUsecase implements Usecase<List<SongEntity>, Unit> {
  final SongsRepository _repository;

  GetRecommendedSongsUsecase(this._repository);

  @override
  Future<Either<Failure, List<SongEntity>>> call(Unit params) async {
    return await _repository.getRecommendedSongs();
  }
}
