import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../features/images/domain/entities/wallpaper.dart';
import '../errors/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

abstract class StreamUseCase<Type, Params> {
  Stream<Either<Failure, Type>> get(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}

class ParamsImage extends Equatable {
  final Wallpaper params;
  const ParamsImage({required this.params});
  @override
  List<Object?> get props => [params, params.id];
}

class UrlAndPage extends Equatable {
  final String params1;
  final int params2;
  const UrlAndPage({ required this.params1 , required this.params2});
  @override
  List<Object?> get props => [params1, params2];
}

class ParamsString extends Equatable {
  final String params;
  const ParamsString({
    required this.params,
  });
  @override
  List<Object?> get props => [params];
}

class ParamsBool extends Equatable {
  final bool params;

  const ParamsBool({
    required this.params,
  });

  @override
  List<Object?> get props => [params];
}

  class ParamsDoubleAndString extends Equatable {
  final double params1;
  final String params2;
  const ParamsDoubleAndString({
  required this.params1,
    required this.params2,
  });
  @override
  List<Object?> get props => [params1, params2];

}

class ParamsWithInt extends Equatable {
  final int params;
  const ParamsWithInt({
    required this.params,
  });
  @override
  List<Object?> get props => [params];

}
