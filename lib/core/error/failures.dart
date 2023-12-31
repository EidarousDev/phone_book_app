import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {}

class EmptyCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}

class UpdateCacheFailure extends Failure {
  @override
  List<Object?> get props => [];
}