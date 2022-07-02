import 'dart:async';
import 'dart:developer';

import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/domain/usecases/get_stored_albums.dart';
import 'package:appsfactory_test/domain/usecases/watch_all_stored_albums.dart';
import 'package:appsfactory_test/presentation/main/bloc/stored_albums_state.dart';
import 'package:dartz/dartz.dart';

class StoredAlbumsCubit extends SafeCubit<StoredAlbumsState> {
  StoredAlbumsCubit() : super(StoredAlbumsStateInitial()){
    _fetchStoredAlbums();
  }
  
  StreamSubscription? subscription;

  Future<void> _startListen(List<AlbumDetail> albumDetails) async {

    final watchStoredAlbum = WatchAllStoredAlbums();
    final result = await watchStoredAlbum(NoParams());

    result.fold(
      (failure){
        log(failure.message.toString());
      }, (stream){
        final newAbumDetails = List<AlbumDetail>.from(albumDetails);
        
        subscription = stream.listen((event) {
          emit(StoredAlbumsStateLoading());

          if(event.deleted){
            newAbumDetails.removeWhere((element) => element.mbid == event.key);
          } else{
            newAbumDetails.add(event.value);
          }

          emit(StoredAlbumsStateSuccess(newAbumDetails));
        });
      },
    );
  }
  
  Future<void> _fetchStoredAlbums() async {
    emit(StoredAlbumsStateLoading());

    final GetStoredAlbums getStoredAlbums = GetStoredAlbums();

    final Either<Failure, List<AlbumDetail>> result = await getStoredAlbums(NoParams());

    result.fold(
      (Failure failure){
        emit(StoredAlbumsStateError(failure.message.toString()));
      }, 
      (List<AlbumDetail> albumDetails){
        emit(StoredAlbumsStateSuccess(albumDetails));
        _startListen(albumDetails);
      },
    );
  }

  @override
  Future<void> close() {
    subscription?.cancel();

    return super.close();
  }
}
