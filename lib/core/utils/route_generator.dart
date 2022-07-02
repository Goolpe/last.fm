import 'package:appsfactory_test/presentation/album_detail/bloc/album_detail_cubit.dart';
import 'package:appsfactory_test/presentation/album_detail/pages/album_detail_page.dart';
import 'package:appsfactory_test/presentation/main/bloc/stored_albums_cubit.dart';
import 'package:appsfactory_test/presentation/main/pages/main_page.dart';
import 'package:appsfactory_test/presentation/search_artists/bloc/search_artists_cubit.dart';
import 'package:appsfactory_test/presentation/search_artists/pages/search_artists_page.dart';
import 'package:appsfactory_test/presentation/top_albums/bloc/top_albums_cubit.dart';
import 'package:appsfactory_test/presentation/top_albums/pages/top_albums_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic>? routeGenerator(RouteSettings settings){
  switch (settings.name) {
    case MainPage.screenName:
      return materialPageRouteProvider(
        create: (_) => StoredAlbumsCubit(),
        screen: const MainPage(),
        settings: settings,
      );
    case AlbumDetailPage.screenName:
      return materialPageRouteProvider(
        create: (_) => AlbumDetailCubit(
          mbid: settings.arguments as String? ?? '',
        ),
        screen: const AlbumDetailPage(), 
        settings: settings,
      );
    case SearchArtistsPage.screenName:
      return materialPageRouteProvider(
        create: (_) => SearchArtistsCubit(),
        screen: const SearchArtistsPage(),
        settings: settings,
      );
    case TopAlbumsPage.screenName:
      return materialPageRouteProvider(
        create: (_) => TopAlbumsCubit(
          artistName: settings.arguments as String? ?? '',
        ),
        screen: const TopAlbumsPage(),
        settings: settings,
      );
    default: return materialPageRoute(
      screen: const Scaffold(), 
      settings: settings,
    );
  }
}

Route<dynamic>? materialPageRouteProvider<T extends StateStreamableSource<dynamic>>({
  required T Function(BuildContext) create,
  required Widget screen,
  required RouteSettings settings,
}){
  return materialPageRoute(
    screen: BlocProvider<T>(
      create: create,
      child: screen,
    ),
    settings: settings,
  );
}

PageRoute<dynamic>? materialPageRoute({
  required Widget screen,
  required RouteSettings settings,
}){
  return MaterialPageRoute<dynamic>(
    settings: settings,
    builder: (BuildContext context) {
      return screen;
    },
  );
}
