import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/track.dart';
import 'package:appsfactory_test/presentation/album_detail/widgets/track_card.dart';
import 'package:appsfactory_test/presentation/widgets/center_text.dart';
import 'package:flutter/material.dart';

class TracksListView extends StatelessWidget {
  const TracksListView({
    required this.tracks,
    super.key,
  });

  final List<Track> tracks;

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    
    if(tracks.isEmpty){
      return CenterText(locale.tracksNotFound);
    }

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => const Divider(height: 1), 
      itemCount: tracks.length,
      padding: const EdgeInsets.only(bottom: 50),
      itemBuilder: (BuildContext context, int index){
        final Track track = tracks[index];

        return TrackCard(track: track);
      }, 
    );
  }
}
