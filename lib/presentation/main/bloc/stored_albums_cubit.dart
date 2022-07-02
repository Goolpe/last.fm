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
    init();
  }
  
  StreamSubscription? subscription;
  List<AlbumDetail> albumDetails = [];

  void init(){
    _startListen();
    _fetchStoredAlbums();
  }
  
  Future<void> _fetchStoredAlbums() async {
    emit(StoredAlbumsStateLoading());

    final GetStoredAlbums getStoredAlbums = GetStoredAlbums();

    final Either<Failure, List<AlbumDetail>> result = await getStoredAlbums(NoParams());

    result.fold(
      (Failure failure){
        emit(StoredAlbumsStateError(failure.message.toString(), _fetchStoredAlbums));
      }, 
      (List<AlbumDetail> albumDetails){
        this.albumDetails = List.from(albumDetails);
        emit(StoredAlbumsStateSuccess(albumDetails));
      },
    );
  }

  Future<void> _startListen() async {

    final watchStoredAlbum = WatchAllStoredAlbums();
    final result = await watchStoredAlbum(NoParams());

    result.fold(
      (failure){
        log(failure.message.toString());
      }, (stream){        
        subscription = stream.listen((event) {
          emit(StoredAlbumsStateLoading());

          if(event.deleted){
            albumDetails.removeWhere((element) => element.mbid == event.key);
          } else{
            albumDetails.add(event.value);
          }

          emit(StoredAlbumsStateSuccess(albumDetails));
        });
      },
    );
  }

  @override
  Future<void> close() {
    subscription?.cancel();

    return super.close();
  }
}
