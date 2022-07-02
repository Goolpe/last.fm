import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/usecases/get_file_path.dart';
import 'package:appsfactory_test/presentation/widgets/image/bloc/album_image_state.dart';

class AlbumImageCubit extends SafeCubit<AlbumImageState> {
  AlbumImageCubit({
    required this.imageUrl,
  }) : super(AlbumImageLoading()){
    getAlbumImage();
  }

  final String? imageUrl;

  Future<void> getAlbumImage() async {
    emit(AlbumImageLoading());

    if(imageUrl == null || imageUrl!.isEmpty){
      emit(AlbumImageEmpty());

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
        emit(AlbumImageError(failure.message.toString()));
      }, (filePath){
        if(filePath != null){
          emit(AlbumImageLocal(filePath));
        } else{
          emit(AlbumImageNetwork(imageUrl!));
        }
      },
    );
  }
}
