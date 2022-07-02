import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/domain/usecases/get_artist_top_albums.dart';
import 'package:appsfactory_test/presentation/top_albums/bloc/top_albums_state.dart';
import 'package:dartz/dartz.dart';

class TopAlbumsCubit extends SafeCubit<TopAlbumsState> {
  TopAlbumsCubit({
    required this.artistName,
  }) : super(TopAlbumsInitial());

  final String artistName;

  Future<Either<Failure<dynamic>, List<AlbumDetail>>> fetchArtistTopAlbums(int page) async {
    final GetArtistTopAlbums getArtistTopAlbums = GetArtistTopAlbums();

    final Either<Failure, List<AlbumDetail>> result = await getArtistTopAlbums(
      GetArtistTopAlbumsParams(
        artistName: artistName,
        page: page,
      ),
    );

    return result;
  }
}
