import 'package:faker/faker.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';

class FakeWallpaper {
  static Wallpaper create({
    String? path,
    String? id,
    String? category,
    int? size,
    int? views,
    String? resolution,
    List<dynamic>? colors,
    String? shortUrl,
    String? fileType,
    String? name,
    String? uploaderName,
    String? thumbsLarge,
  }) {
    return Wallpaper(
      path: path ?? faker.internet.httpsUrl(),
      id: id ?? faker.randomGenerator.integer(1000).toString(),
      category: category ?? faker.randomGenerator.string(100),
      size: size ?? faker.randomGenerator.integer(10000),
      views: views ?? faker.randomGenerator.integer(10000),
      resolution: resolution ?? faker.randomGenerator.string(100),
      colors: colors ?? [],
      shortUrl: shortUrl ?? faker.randomGenerator.string(100),
      name: name ?? faker.person.name(),
      uploaderName: uploaderName ?? faker.person.name(),
      thumbsLarge: thumbsLarge ?? faker.randomGenerator.string(100),
      fileType: fileType ?? faker.randomGenerator.string(100),
    );
  }

  static Iterable<Wallpaper> createIterable({required int size}) {
    List<Wallpaper> iterable = <Wallpaper>[];
    for (int i = 0; i < size; i++) {
      iterable.add(create());
    }
    return iterable;
  }
}
