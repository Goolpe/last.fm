import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/domain/usecases/get_album_detail.dart';
import 'package:appsfactory_test/presentation/album_detail/bloc/album_detail_state.dart';
import 'package:dartz/dartz.dart';

class AlbumDetailCubit extends SafeCubit<AlbumDetailState> {
  AlbumDetailCubit({
    required this.mbid,
  }) : super(AlbumDetailLoading()){
    fetchAlbumDetail();
  }

  final String mbid;

  Future<void> fetchAlbumDetail() async {
    emit(AlbumDetailLoading());

    final GetAlbumDetail getAlbumDetail = GetAlbumDetail();

    final Either<Failure, AlbumDetail> result = await getAlbumDetail(
      GetAlbumDetailParams(
        mbid: mbid,
      ),
    );
    
    result.fold(
      (Failure failure){
        emit(AlbumDetailError(failure.message.toString(), fetchAlbumDetail));
      }, 
      (AlbumDetail albumDetail){
        emit(AlbumDetailSuccess(albumDetail));
      },
    );
  }
}
