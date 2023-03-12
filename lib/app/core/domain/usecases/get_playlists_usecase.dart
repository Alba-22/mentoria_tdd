import 'package:fpdart/fpdart.dart';
import 'package:tunefy/app/core/domain/entities/playlist_entity.dart';
import 'package:tunefy/app/core/domain/entities/usecase.dart';
import 'package:tunefy/app/core/domain/errors/failures.dart';
import 'package:tunefy/app/core/domain/repositories/core_repository.dart';

class GetPlaylistsUsecase implements Usecase<List<PlaylistEntity>, Unit> {
  final CoreRepository _repository;

  GetPlaylistsUsecase(this._repository);

  @override
  Future<Either<Failure, List<PlaylistEntity>>> call(Unit params) async {
    return await _repository.getPlaylists();
  }
}
