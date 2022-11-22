import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import '../errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call (Params params);
}

class NoParams extends Equatable{
  @override
  List<Object?> get props => [];

}

class Params extends Equatable {


  final Wallpaper wallpaper;
  const Params(this.wallpaper);

  @override
  List<Object?> get props => [wallpaper, wallpaper.id];

}

