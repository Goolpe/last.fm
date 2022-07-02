import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/usecases/get_file_path.dart';
import 'package:appsfactory_test/presentation/widgets/image/bloc/album_image_state.dart';

class AlbumImageCubit extends SafeCubit<AlbumImageState> {
  AlbumImageCubit({
    required this.imageUrl,
  }) : super(AlbumImageStateLoading()){
    getAlbumImage();
  }

  final String? imageUrl;

  Future<void> getAlbumImage() async {
    emit(AlbumImageStateLoading());

    if(imageUrl == null || imageUrl!.isEmpty){
      emit(AlbumImageStateEmpty());

      return;
    }

    final GetFilePath getFilePath = GetFilePath();

    final result = await getFilePath(
      GetFilePathParams(
        imageUrl: imageUrl!,
      ),
    );

    result.fold(
      (failure){
        emit(AlbumImageStateError(failure.message.toString()));
      }, (filePath){
        if(filePath != null){
          emit(AlbumImageStateLocal(filePath));
        } else{
          emit(AlbumImageStateNetwork(imageUrl!));
        }
      },
    );
  }
}
