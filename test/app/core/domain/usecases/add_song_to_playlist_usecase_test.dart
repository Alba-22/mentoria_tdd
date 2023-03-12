import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tunefy/app/core/domain/entities/playlist_entity.dart';
import 'package:tunefy/app/core/domain/entities/song_entity.dart';
import 'package:tunefy/app/core/domain/repositories/core_repository.dart';
import 'package:tunefy/app/core/domain/usecases/add_song_to_playlist_usecase.dart';

import 'package:mocktail/mocktail.dart';

class _MockCoreRepository extends Mock implements CoreRepository {}

void main() {
  late AddSongToPlaylistUsecase usecase;
  late CoreRepository repository;

  setUp(() {
    repository = _MockCoreRepository();
    usecase = AddSongToPlaylistUsecase(repository);
    registerFallbackValue(_song);
    registerFallbackValue(_playlist);
  });

  test(
    "Deve chamar repository para adicionar música em uma playlist",
    () async {
      // Arrange
      const params = AddSongToPlaylistParams(
        song: _song,
        playlist: _playlist,
      );
      when(() => repository.addSongToPlaylist(any(), any())).thenAnswer((_) async => const Right(unit));

      // Act
      final result = await usecase.call(params);

      // Assert
      expect(result, const Right(unit));
      verify(() => repository.addSongToPlaylist(_song, _playlist)).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}

const _song = SongEntity(
  id: "abc",
  name: "My Demons",
  imageURL: "",
  authorName: "STARSET",
);

const _playlist = PlaylistEntity(
  id: "123",
  name: "Rock",
  imageURL: "",
  songsQuantity: 4,
  totalSeconds: 1523,
);
