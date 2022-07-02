import 'package:appsfactory_test/domain/usecases/delete_album.dart';
import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class DeleteAlbumButton extends StatelessWidget {
  const DeleteAlbumButton({
    required this.mbid,
    required this.imageUrl,
    super.key,
  });

  final String mbid;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return LoadButton(
      icon: Icons.delete_outline_outlined,
      onPressed: (){
        final DeleteAlbum deleteAlbum = DeleteAlbum();

        return deleteAlbum(
          DeleteAlbumParams(
            mbid: mbid, 
            imageUrl: imageUrl,
          ),
        );
      },
    );
  }
}
