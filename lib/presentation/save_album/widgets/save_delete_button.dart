import 'package:appsfactory_test/core/core.dart';
import 'package:appsfactory_test/presentation/save_album/bloc/save_delete_album_cubit.dart';
import 'package:appsfactory_test/presentation/save_album/bloc/save_delete_album_state.dart';
import 'package:appsfactory_test/presentation/widgets/loading_indicator.dart';
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
      child: BlocListener<SaveDeleteAlbumCubit, SaveDeleteAlbumState>(
        listener: (BuildContext context, SaveDeleteAlbumState state) {
          if(state is SaveDeleteAlbumStateError){
            showErrorFlushbar(context, state.error);
          }
        },
        child: BlocBuilder<SaveDeleteAlbumCubit, SaveDeleteAlbumState>(
          builder: (BuildContext context, SaveDeleteAlbumState state){
            final SaveDeleteAlbumCubit cubit = context.read<SaveDeleteAlbumCubit>();

            if(state is SaveDeleteAlbumStateNetwork){
              return IconButton(
                icon: const Icon(Icons.save_alt, color: Colors.grey,),
                onPressed: cubit.save,
              );
            }

            if(state is SaveDeleteAlbumStateLocal){
              return IconButton(
                icon: const Icon(Icons.delete_forever, color: Colors.grey,),
                onPressed: cubit.delete, 
              );
            }

            if(state is SaveDeleteAlbumStateError){
              return IconButton(
                icon: const Icon(Icons.replay, color: Colors.red,),
                onPressed: state.repeat,
              );
            }

            return const IconButton(
              icon: LoadingIndicator(
                size: 24,
                strokeWidth: 2,
                color: Colors.grey,
              ),
              onPressed: null, 
            );
          },
        ),
      ),
    );
  }
}
