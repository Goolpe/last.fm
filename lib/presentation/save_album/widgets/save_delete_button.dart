import 'package:appsfactory_test/presentation/save_album/bloc/save_delete_album_cubit.dart';
import 'package:appsfactory_test/presentation/save_album/bloc/save_delete_album_state.dart';
import 'package:appsfactory_test/presentation/save_album/widgets/delete_album_button.dart';
import 'package:appsfactory_test/presentation/save_album/widgets/save_album_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SaveDeleteButton extends StatelessWidget {
  const SaveDeleteButton({
    required this.mbid,
    required this.imageUrl,
    super.key,
  });

  final String mbid;
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SaveDeleteAlbumCubit(
        mbid: mbid,
        imageUrl: imageUrl,
      ),
      child: BlocBuilder<SaveDeleteAlbumCubit, SaveDeleteAlbumState>(
        builder: (BuildContext context, SaveDeleteAlbumState state){

          if(state is SaveDeleteAlbumNetwork){
            return SaveAlbumButton(
              mbid: mbid,
              imageUrl: imageUrl,
            );
          }

          if(state is SaveDeleteAlbumLocal){
            return DeleteAlbumButton(
              mbid: mbid,
              imageUrl: imageUrl,
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
