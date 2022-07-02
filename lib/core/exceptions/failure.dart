import 'package:equatable/equatable.dart';

abstract class Failure<Type> extends Equatable {
  const Failure([this.message]);

  final Type? message;

  @override
  List<Object?> get props => <Type?>[message];
}

class ServerFailure extends Failure<String> {
  const ServerFailure([String super.message = '']);

  @override
  List<Object?> get props => <String?>[message];
}

class ClientFailure extends Failure<String> {
  const ClientFailure([String super.message = '']);

  @override
  List<Object?> get props => <String?>[message];
}
