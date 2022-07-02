import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/presentation/top_albums/bloc/top_albums_cubit.dart';
import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TopAlbumsPage extends StatelessWidget {
  const TopAlbumsPage({
    super.key,
  });

  static const String screenName = '/top-albums';

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final TopAlbumsCubit cubit = context.read<TopAlbumsCubit>();
    
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.topAlbumsPage),
      ),
      body: NestedWrapper(
        title: cubit.artistName,
        body: LazyListView<AlbumDetail>(
          onFetchPage: cubit.fetchArtistTopAlbums,
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          padding: const EdgeInsets.all(12),
          onEmpty: (BuildContext context) {        
            return TextWithButton(
              text: locale.thereAreNoAlbumsHereYet,
              textButton: locale.back,
              onPressed: () => Navigator.pop(context),
            );
          },
          itemBuilder: (AlbumDetail albumDetail, int index) {
            return AlbumCard(albumDetail: albumDetail);
          },
        ),
      ),
    );
  }
}
