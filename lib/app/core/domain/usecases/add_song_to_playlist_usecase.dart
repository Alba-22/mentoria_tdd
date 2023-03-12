import 'package:fpdart/fpdart.dart';

import 'package:tunefy/app/core/domain/entities/playlist_entity.dart';
import 'package:tunefy/app/core/domain/entities/song_entity.dart';
import 'package:tunefy/app/core/domain/entities/usecase.dart';
import 'package:tunefy/app/core/domain/errors/failures.dart';

import '../repositories/core_repository.dart';

class AddSongToPlaylistUsecase implements Usecase<Unit, AddSongToPlaylistParams> {
  final CoreRepository _repository;

  AddSongToPlaylistUsecase(this._repository);

  @override
  Future<Either<Failure, Unit>> call(AddSongToPlaylistParams params) async {
    return await _repository.addSongToPlaylist(params.song, params.playlist);
  }
}

class AddSongToPlaylistParams {
  final SongEntity song;
  final PlaylistEntity playlist;

  const AddSongToPlaylistParams({
    required this.song,
    required this.playlist,
  });
}
