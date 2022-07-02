import 'dart:async';

import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/presentation/widgets/load_button/bloc/load_button_state.dart';
import 'package:dartz/dartz.dart';

class LoadButtonCubit extends SafeCubit<LoadButtonState> {
  LoadButtonCubit(this.func) : super(LoadButtonInitial());

  final Future<Either<Failure, void>> Function() func;

  Future<void> action() async {
    emit(LoadButtonLoading());

    final Either<Failure, void> result = await func();
    
    result.fold(
      (Failure failure) {
        emit(LoadButtonError(
          failure.message.toString(),
        ));
      }, 
      (r) {
        emit(LoadButtonSuccess());
      },
    );
  }
}
