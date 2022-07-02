import 'package:equatable/equatable.dart';

abstract class LoadButtonState extends Equatable{
  const LoadButtonState();

  @override
  List<Object> get props => [];
}

class LoadButtonInitial extends LoadButtonState{}

class LoadButtonLoading extends LoadButtonState{}

class LoadButtonSuccess extends LoadButtonState{}

class LoadButtonError extends LoadButtonState{
  const LoadButtonError(this.error);

  final String error;

  @override
  List<Object> get props => [error];
}
