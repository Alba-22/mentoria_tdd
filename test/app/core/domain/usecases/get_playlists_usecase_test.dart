import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:tunefy/app/core/domain/entities/playlist_entity.dart';
import 'package:tunefy/app/core/domain/repositories/core_repository.dart';
import 'package:tunefy/app/core/domain/usecases/get_playlists_usecase.dart';

import 'package:mocktail/mocktail.dart';

class _MockCoreRepository extends Mock implements CoreRepository {}

void main() {
  late GetPlaylistsUsecase usecase;
  late CoreRepository repository;

  setUp(() {
    repository = _MockCoreRepository();
    usecase = GetPlaylistsUsecase(repository);
  });

  test(
    "Deve chamar o repository para obter a lista de playlists",
    () async {
      // Arrange
      when(() => repository.getPlaylists()).thenAnswer((_) async => const Right(<PlaylistEntity>[]));

      // Act
      final result = await usecase.call(unit);

      // Assert
      expect(result, const Right(<PlaylistEntity>[]));
      verify(() => repository.getPlaylists()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
