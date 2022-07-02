import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/artist.dart';
import 'package:appsfactory_test/presentation/search_artists/bloc/search_artists_cubit.dart';
import 'package:appsfactory_test/presentation/search_artists/bloc/search_artists_state.dart';
import 'package:appsfactory_test/presentation/search_artists/widgets/artist_card.dart';
import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchArtistsBuilder extends BlocBuilder<SearchArtistsCubit, SearchArtistsState> {
  const SearchArtistsBuilder({
    super.key,
  }) : super(
    builder: _builder,
  );

  static Widget _builder(BuildContext context, SearchArtistsState state) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    
    if(state is SearchArtistsSuccess){
      return LazyListView<Artist>(
        key: UniqueKey(),
        separatorBuilder: (context, index) => const Divider(height: 5),
        onFetchPage: context.read<SearchArtistsCubit>().fetchArtists,
        padding: const EdgeInsets.all(12),
        onEmpty: (BuildContext context) {        
          return CenterText(locale.nothingFound);
        },
        itemBuilder: (Artist item, int index) {
          return ArtistCard(artist: item);
        },
      );
    }

    return CenterText(locale.inputSomething);
  }
}
