import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/presentation/search_artists/bloc/search_artists_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchArtistsField extends StatelessWidget {
  const SearchArtistsField({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final SearchArtistsCubit cubit = context.read<SearchArtistsCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              autofocus: true,
              maxLength: 50,
              controller: cubit.searchController,
              onEditingComplete: cubit.search,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                labelText: locale.enterArtist,
                counterText: '',
              ),
            ),
          ),
          IconButton(
            onPressed: cubit.search,
            icon: const Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}
