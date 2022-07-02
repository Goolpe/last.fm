import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/presentation/main/widgets/stored_albums_builder.dart';
import 'package:appsfactory_test/presentation/search_artists/pages/search_artists_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  static const String screenName = '/';

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.mainPage),
        actions: [
          IconButton(
            onPressed: () =>
              Navigator.pushNamed(context, SearchArtistsPage.screenName),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: const StoredAlbumsBuilder(),
    );
  }
}
