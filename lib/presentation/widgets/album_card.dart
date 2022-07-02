import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/presentation/album_detail/pages/album_detail_page.dart';
import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    required this.albumDetail,
    super.key,
  });

  final AlbumDetail albumDetail;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: AlbumTile(
        albumDetail: albumDetail,
        onTap: () => Navigator.pushNamed(
          context,
          AlbumDetailPage.screenName,
          arguments: albumDetail.mbid,
        ),
      ),
    );
  }
}
