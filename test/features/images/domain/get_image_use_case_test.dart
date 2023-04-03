import 'package:dartz/dartz.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:wallnex/const/const_api_url.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import 'package:wallnex/features/images/domain/repository/image_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:wallnex/features/images/domain/usecases/get_image_use_case.dart';
import 'fakeEntities/fake_wallpaper.dart';

class MockImageRepo extends Mock implements ImageRepo {}

@GenerateMocks([MockImageRepo])
void main() {
  late MockImageRepo mockImageRepo;
  late GetImageUseCase getImageUseCase;
  int page = 0;
  Iterable<Wallpaper> list = FakeWallpaper.createIterable(size: 20);

  setUp(() {
    mockImageRepo = MockImageRepo();
    getImageUseCase = GetImageUseCase(imageRepo: mockImageRepo);
  });

  test(
    'should return Iterable with Images from repository',
    () async {
      when(mockImageRepo.getWallpapers(kUrl, page))
          .thenAnswer((_) async => Right(list));
      final result = await getImageUseCase(UrlAndPage(params1: kUrl, params2: page));

      expect(result, list);
      verify(mockImageRepo.getWallpapers(kUrl, page));
      verifyNoMoreInteractions(mockImageRepo);
    },
  );
}
