import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure();
  @override
  List<Object> get props => [];
}

class ServerFailure extends Failure {
  String? message;
  ServerFailure(this.message);
}

class CacheFailure extends Failure {}
