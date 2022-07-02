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
  }) : super(SaveDeleteAlbumStateInitial()){
    init();
  }

  final String mbid;
  final String? imageUrl;

  StreamSubscription? subscription;

  Future<void> startListen() async {
    final watchStoredAlbum = WatchStoredAlbum();

    final result = await watchStoredAlbum(
      WatchStoredAlbumParams(mbid: mbid),
    );

    result.fold(
      (failure){
        log(failure.message.toString());
      }, (stream){
        subscription = stream.listen((event) {
          if(state is! SaveDeleteAlbumStateLoading){
            if(event.deleted){
              emit(SaveDeleteAlbumStateNetwork());
            } else{
              emit(SaveDeleteAlbumStateLocal());
            }
          }
        });
      },
    );
  }

  Future<void> init() async {
    final IsStoredAlbum isStoredAlbum = IsStoredAlbum();

    final Either<Failure, bool> result = await isStoredAlbum(
      IsStoredAlbumParams(
        mbid: mbid,
      ),
    );

    result.fold((failure){
      emit(SaveDeleteAlbumStateError(failure.message.toString(), init));
    }, (contains){
      
      startListen();

      if(contains){
        emit(SaveDeleteAlbumStateLocal());
      } else{
        emit(SaveDeleteAlbumStateNetwork());
      }
    },
    );
  }

  @override
  Future<void> close() {
    subscription?.cancel();

    return super.close();
  }

  Future<void> save() async {
    emit(SaveDeleteAlbumStateLoading());

    final SaveAlbum saveAlbum = SaveAlbum();

    final Either<Failure, void> result = await saveAlbum(
      SaveAlbumParams(mbid: mbid, imageUrl: imageUrl),
    );
    
    result.fold(
      (Failure failure) {
        emit(SaveDeleteAlbumStateError(
          failure.message.toString(), 
          save,
        ));
      }, 
      (r) {
        emit(SaveDeleteAlbumStateLocal());
      },
    );
  }

  Future<void> delete() async {
    emit(SaveDeleteAlbumStateLoading());

    final DeleteAlbum deleteAlbum = DeleteAlbum();

    final Either<Failure, void> result = await deleteAlbum(
      DeleteAlbumParams(mbid: mbid, imageUrl: imageUrl),
    );

    result.fold(
      (Failure failure) {
        emit(SaveDeleteAlbumStateError(
          failure.message.toString(), 
          delete,
        ));
      }, 
      (r) {
        emit(SaveDeleteAlbumStateNetwork());
      },
    );
  }
}
