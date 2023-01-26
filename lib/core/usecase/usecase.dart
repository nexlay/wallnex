import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../features/images/domain/entities/wallpaper.dart';
import '../errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class ParamsImage extends Equatable {
  final Wallpaper wallpaper;
  const ParamsImage({required this.wallpaper});
  @override
  List<Object?> get props => [wallpaper, wallpaper.id];
}

class ParamsIntAndString extends Equatable {
  final String st;
  final int number;
  const ParamsIntAndString({required this.number, required this.st});
  @override
  List<Object?> get props => [st, number];
}

class ParamsString extends Equatable {
  final String st;
  const ParamsString({
    required this.st,
  });
  @override
  List<Object?> get props => [st];
}

class ParamsBool extends Equatable {
  final bool bl;

  const ParamsBool({
    required this.bl,
  });

  @override
  List<Object?> get props => [bl];
}

  class ParamsDoubleAndString extends Equatable {
  final double db;
  final String st;
  const ParamsDoubleAndString({
  required this.db,
    required this.st,
  });
  @override
  List<Object?> get props => [db, st];


}
