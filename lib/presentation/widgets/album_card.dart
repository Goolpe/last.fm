import 'package:appsfactory_test/presentation/album_detail/pages/album_detail_page.dart';
import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    required this.imageUrl,
    required this.albumName,
    required this.artistName,
    required this.mbid,
    super.key,
  });

  final String? imageUrl;
  final String albumName;
  final String artistName;
  final String mbid;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: AlbumTile(
        imageUrl: imageUrl,
        albumName: albumName,
        artistName: artistName,
        mbid: mbid,
        onTap: () => Navigator.pushNamed(
          context, 
          AlbumDetailPage.screenName,
          arguments: mbid,
        ),
      ),
    );
  }
}
