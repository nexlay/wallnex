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

class Params extends Equatable {
  final Wallpaper wallpaper;
  const Params({required this.wallpaper});
  @override
  List<Object?> get props => [wallpaper, wallpaper.id];
}

class ParamsTwo extends Equatable {
  final String params;
  final int param;
  const ParamsTwo({required this.param, required this.params});
  @override
  List<Object?> get props => [params, param];
}

class ParamsThree extends Equatable {
  final String params;
  const ParamsThree({
    required this.params,
  });
  @override
  List<Object?> get props => [params];
}


