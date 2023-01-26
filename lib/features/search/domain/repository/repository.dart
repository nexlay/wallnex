import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class SearchRepo {
  Future<Either<Failure, void>> pushSearchHistory (String query);
  Future<Either<Failure, List<String>>> getSearchHistory ();
}