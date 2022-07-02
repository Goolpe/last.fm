import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/presentation/album_detail/widgets/album_info.dart';
import 'package:flutter/material.dart';

class AlbumDetailPage extends StatelessWidget {
  const AlbumDetailPage({
    super.key,
  });

  static const String screenName = '/album-detail';

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.detailPage),
      ),
      body: const AlbumInfo(),
    );
  }
}
