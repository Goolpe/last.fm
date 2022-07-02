import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/album_detail.dart';
import 'package:appsfactory_test/presentation/album_detail/bloc/album_detail_cubit.dart';
import 'package:appsfactory_test/presentation/album_detail/bloc/album_detail_state.dart';
import 'package:appsfactory_test/presentation/album_detail/widgets/tracks_list_view.dart';
import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumInfo extends StatelessWidget {
  const AlbumInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    
    return BlocBuilder<AlbumDetailCubit, AlbumDetailState>(
      builder: (BuildContext context, AlbumDetailState state) {

        if(state is AlbumDetailError){
          return TextWithButton(
            text: state.error, 
            textButton: locale.tryAgain, 
            onPressed: state.repeat,
          );
        }

        if(state is AlbumDetailSuccess){
          final AlbumDetail albumDetail = state.albumDetail;
        
          return ListView(
            children: [
              AlbumTile(albumDetail: albumDetail),
              const Divider(height: 1),
              ListTile(
                title: Row(
                  children: [
                    Text(
                      locale.tracklist, 
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    if(albumDetail.tracks.isNotEmpty)
                      Text(' [${albumDetail.tracks.length}]'),
                  ],
                ),
              ),
              TracksListView(tracks: albumDetail.tracks),
            ],
          );
        }

        return const LoadingIndicator();
      },
    );
  }
}
