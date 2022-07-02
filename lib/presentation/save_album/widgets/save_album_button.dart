import 'package:appsfactory_test/domain/usecases/save_album.dart';
import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SaveAlbumButton extends StatelessWidget {
  const SaveAlbumButton({
    required this.mbid,
    required this.imageUrl,
    super.key,
  });

  final String mbid;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return LoadButton(
      icon: Icons.save_alt_outlined,
      onPressed: (){
        final SaveAlbum saveAlbum = SaveAlbum();

        return saveAlbum(
          SaveAlbumParams(
            mbid: mbid, 
            imageUrl: imageUrl,
          ),
        );
      },
    );
  }
}
