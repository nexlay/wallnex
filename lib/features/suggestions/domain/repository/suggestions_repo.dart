import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../images/domain/entities/wallpaper.dart';

abstract class SuggestionsRepo {
  ///Get suggestion
  Future<Either<Failure, Iterable<Wallpaper>>> getSuggestions(String id);
}