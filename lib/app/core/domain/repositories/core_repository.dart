import 'package:fpdart/fpdart.dart';
import 'package:tunefy/app/core/domain/entities/playlist_entity.dart';
import 'package:tunefy/app/core/domain/entities/song_entity.dart';
import 'package:tunefy/app/core/domain/errors/failures.dart';

abstract class CoreRepository {
  Future<Either<Failure, List<PlaylistEntity>>> getPlaylists();
  Future<Either<Failure, Unit>> addSongToPlaylist(SongEntity song, PlaylistEntity playlist);
}
