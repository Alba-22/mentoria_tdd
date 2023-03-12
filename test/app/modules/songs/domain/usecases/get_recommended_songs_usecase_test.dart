import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tunefy/app/core/domain/entities/song_entity.dart';
import 'package:tunefy/app/modules/songs/domain/repositories/songs_repository.dart';
import 'package:tunefy/app/modules/songs/domain/usecases/get_recommended_songs_usecase.dart';

class _MockSongsRepository extends Mock implements SongsRepository {}

void main() {
  late GetRecommendedSongsUsecase usecase;
  late SongsRepository repository;

  setUp(() {
    repository = _MockSongsRepository();
    usecase = GetRecommendedSongsUsecase(repository);
  });

  test(
    "Deve chamar o repository para obter a lista de músicas recomendadas",
    () async {
      // Arrange
      when(() => repository.getRecommendedSongs()).thenAnswer((_) async => const Right(<SongEntity>[]));

      // Act
      final result = await usecase.call(unit);

      // Assert
      expect(result, const Right(<SongEntity>[]));
      verify(() => repository.getRecommendedSongs()).called(1);
      verifyNoMoreInteractions(repository);
    },
  );
}
