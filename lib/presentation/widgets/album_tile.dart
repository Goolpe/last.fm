import 'package:appsfactory_test/presentation/save_album/widgets/save_delete_button.dart';
import 'package:appsfactory_test/presentation/widgets/af_list_tile.dart';
import 'package:appsfactory_test/presentation/widgets/image/widgets/album_image.dart';
import 'package:flutter/material.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({
    required this.imageUrl,
    required this.albumName,
    required this.artistName,
    required this.mbid,
    this.onTap,
    super.key,
  });

  final String? imageUrl;
  final String albumName;
  final String artistName;
  final String mbid;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AFListTile(
      leading: AlbumImage(
        imageUrl: imageUrl,
      ),
      title: albumName,
      subtitle: artistName,
      trailing: SaveDeleteButton(
        mbid: mbid,
        imageUrl: imageUrl,
      ),
      onTap: onTap,
    );
  }
}
