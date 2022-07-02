import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/domain/enitities/track.dart';
import 'package:flutter/material.dart';

class TrackCard extends StatelessWidget {
  const TrackCard({
    required this.track,
    super.key,
  });

  final Track track;

  @override
  Widget build(BuildContext context) {    
    return ListTile(
      dense: true,
      minLeadingWidth: 0,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(track.rank.toString()),
        ],
      ),
      title: Text(track.name),
      trailing: track.duration != null
      ? Text(Helpers.durationToMinutes(track.duration!)) : null,
    );
  }
}
