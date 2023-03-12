import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tunefy/app/modules/songs/domain/errors/failures.dart';
import 'package:tunefy/app/modules/songs/domain/repositories/songs_repository.dart';
import 'package:tunefy/app/modules/songs/domain/usecases/search_song_usecase.dart';

class _MockSongsRepository extends Mock implements SongsRepository {}

void main() {
  late SearchSongUsecase usecase;
  late SongsRepository repository;

  setUp(() {
    repository = _MockSongsRepository();
    usecase = SearchSongUsecase(repository);
  });

  test(
    "Deve chamar repository quando o texto a ser buscado não for vazio",
    () async {
      // Arrange
      const text = "STARSET";
      when(() => repository.getSongsByText(any())).thenAnswer((_) async => const Right([]));

      // Act
      await usecase.call(text);

      // Assert
      verify(() => repository.getSongsByText(text)).called(1);
    },
  );

  test(
    "Deve retornar EmptyTextFailure se o texto a ser buscado for vazio",
    () async {
      // Arrange
      const text = "";

      // Act
      final result = await usecase.call(text);

      // Assert
      expect(result, const Left(EmptyTextFailure()));
    },
  );
}
