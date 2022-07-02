import 'package:appsfactory_test/domain/enitities/artist.dart';
import 'package:appsfactory_test/presentation/top_albums/pages/top_albums_page.dart';
import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ArtistCard extends StatelessWidget {
  const ArtistCard({
    required this.artist,
    super.key,
  });

  final Artist artist;

  @override
  Widget build(BuildContext context) {
    return AFListTile(
      leading: ImageNetwork(
        artist.imageUrl,
      ),
      title: artist.name,
      onTap: () => Navigator.pushNamed(
        context, 
        TopAlbumsPage.screenName,
        arguments: artist.name,
      ),
    );
  }
}
