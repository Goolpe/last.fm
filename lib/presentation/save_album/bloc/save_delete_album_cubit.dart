import 'dart:async';
import 'dart:developer';

import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/usecases/delete_album.dart';
import 'package:appsfactory_test/domain/usecases/is_stored_album.dart';
import 'package:appsfactory_test/domain/usecases/save_album.dart';
import 'package:appsfactory_test/domain/usecases/watch_stored_album.dart';
import 'package:appsfactory_test/presentation/save_album/bloc/save_delete_album_state.dart';
import 'package:dartz/dartz.dart';

class SaveDeleteAlbumCubit extends SafeCubit<SaveDeleteAlbumState> {
  SaveDeleteAlbumCubit({
    required this.mbid,
    required this.imageUrl,
  }) : super(SaveDeleteAlbumInitial()){
    init();
  }

  final String mbid;
  final String? imageUrl;

  StreamSubscription? subscription;

  void init() {
    _startListen();
    _containsStoredAlbum();
  }

  Future<void> _containsStoredAlbum() async {
    final IsStoredAlbum isStoredAlbum = IsStoredAlbum();

    final Either<Failure, bool> result = await isStoredAlbum(
      IsStoredAlbumParams(
        mbid: mbid,
      ),
    );

    result.fold((failure){
      emit(SaveDeleteAlbumError(failure.message.toString(), _containsStoredAlbum));
    }, (contains){
      if(contains){
        emit(SaveDeleteAlbumLocal());
      } else{
        emit(SaveDeleteAlbumNetwork());
      }
    },);
  }

  Future<void> _startListen() async {
    final watchStoredAlbum = WatchStoredAlbum();

    final result = await watchStoredAlbum(
      WatchStoredAlbumParams(mbid: mbid),
    );

    result.fold(
      (failure){
        log(failure.message.toString());
      }, (stream){
        subscription = stream.listen((event) {
          if(state is! SaveDeleteAlbumLoading){
            if(event.deleted){
              emit(SaveDeleteAlbumNetwork());
            } else{
              emit(SaveDeleteAlbumLocal());
            }
          }
        });
      },
    );
  }

  @override
  Future<void> close() {
    subscription?.cancel();

    return super.close();
  }

  Future<void> save() async {
    emit(SaveDeleteAlbumLoading());

    final SaveAlbum saveAlbum = SaveAlbum();

    final Either<Failure, void> result = await saveAlbum(
      SaveAlbumParams(mbid: mbid, imageUrl: imageUrl),
    );
    
    result.fold(
      (Failure failure) {
        emit(SaveDeleteAlbumError(
          failure.message.toString(), 
          save,
        ));
      }, 
      (r) {
        emit(SaveDeleteAlbumLocal());
      },
    );
  }

  Future<void> delete() async {
    emit(SaveDeleteAlbumLoading());

    final DeleteAlbum deleteAlbum = DeleteAlbum();

    final Either<Failure, void> result = await deleteAlbum(
      DeleteAlbumParams(mbid: mbid, imageUrl: imageUrl),
    );

    result.fold(
      (Failure failure) {
        emit(SaveDeleteAlbumError(
          failure.message.toString(), 
          delete,
        ));
      }, 
      (r) {
        emit(SaveDeleteAlbumNetwork());
      },
    );
  }
}
