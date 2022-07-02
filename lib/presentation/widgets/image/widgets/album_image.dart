import 'dart:io';

import 'package:appsfactory_test/presentation/widgets/image/bloc/album_image_cubit.dart';
import 'package:appsfactory_test/presentation/widgets/image/bloc/album_image_state.dart';
import 'package:appsfactory_test/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AlbumImage extends StatelessWidget {
  const AlbumImage({
    required this.imageUrl,
    this.height = 70,
    this.width = 70,
    super.key,
  });

  final String? imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AlbumImageCubit(
        imageUrl: imageUrl,
      ),
      child: BlocBuilder<AlbumImageCubit, AlbumImageState>(
        builder: (BuildContext context, AlbumImageState state){
          if(state is AlbumImageNetwork){
            return ImageNetwork(
              state.imageUrl,
              height: height,
              width: width,
            );
          }

          if(state is AlbumImageLocal){
            return Image.file(
              File(state.imagePath),
              height: height,
              width: width,
              errorBuilder: (BuildContext context, Object obj, _){
                return _emptyBox();
              },
            );
          }

          return _emptyBox();
        },
      ),
    );
  }

  Widget _emptyBox(){
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
