import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/presentation/save_album/widgets/save_delete_button.dart';
import 'package:appsfactory_test/presentation/widgets/af_list_tile.dart';
import 'package:appsfactory_test/presentation/widgets/album_image/widgets/album_image.dart';
import 'package:flutter/material.dart';

class AlbumTile extends StatelessWidget {
  const AlbumTile({
    required this.albumDetail,
    this.onTap,
    super.key,
  });

  final AlbumDetail albumDetail;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return AFListTile(
      leading: AlbumImage(
        imageUrl: albumDetail.imageUrl,
      ),
      title: albumDetail.name,
      subtitle: albumDetail.artistName,
      trailing: SaveDeleteButton(
        mbid: albumDetail.mbid,
        imageUrl: albumDetail.imageUrl,
      ),
      onTap: onTap,
    );
  }
}
