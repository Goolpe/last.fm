import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/presentation/search_artists/widgets/search_artists_builder.dart';
import 'package:appsfactory_test/presentation/search_artists/widgets/search_artists_field.dart';
import 'package:flutter/material.dart';

class SearchArtistsPage extends StatelessWidget {
  const SearchArtistsPage({super.key});

  static const String screenName = '/search';

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.searchPage),
      ),
      body: Column(
        children: const [
          SearchArtistsField(),
          Expanded(
            child: SearchArtistsBuilder(),
          ),
        ],
      ),
    );
  }
}
