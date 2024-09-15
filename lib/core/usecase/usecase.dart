import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wallnex/features/messaging/domain/entities/search_user.dart';
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

class ParamsSearchUser extends Equatable {
  final SearchUser params;
  const ParamsSearchUser({required this.params});
  @override
  List<Object?> get props => [params];
}

class UrlAndPage extends Equatable {
  final String params1;
  final int params2;
  const UrlAndPage({required this.params1, required this.params2});
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

class ParamsMultiString extends Equatable {
  final String params;
  final String params1;
  const ParamsMultiString({
    required this.params,
    required this.params1,
  });
  @override
  List<Object?> get props => [params, params1];
}

class ParamsBool extends Equatable {
  final bool params;

  const ParamsBool({
    required this.params,
  });

  @override
  List<Object?> get props => [params];
}

class ParamsWithInt extends Equatable {
  final int params;
  const ParamsWithInt({
    required this.params,
  });
  @override
  List<Object?> get props => [params];
}
