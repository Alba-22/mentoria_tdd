import 'package:fpdart/fpdart.dart';
import 'package:tunefy/app/core/domain/entities/song_entity.dart';
import 'package:tunefy/app/core/domain/entities/usecase.dart';
import 'package:tunefy/app/core/domain/errors/failures.dart';

import '../errors/failures.dart';
import '../repositories/songs_repository.dart';

class SearchSongUsecase implements Usecase<List<SongEntity>, String> {
  final SongsRepository _repository;

  SearchSongUsecase(this._repository);

  @override
  Future<Either<Failure, List<SongEntity>>> call(String text) async {
    if (text.isNotEmpty) {
      return await _repository.getSongsByText(text);
    }

    return const Left(EmptyTextFailure());
  }
}
