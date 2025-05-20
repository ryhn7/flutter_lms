import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../errors/failure.dart';

/// A base abstract class for all use cases in the application
///
/// [Type] is the type of data returned from the use case
/// [Params] is the parameters required by the use case
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

/// A class for use cases that don't require any parameters
class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
