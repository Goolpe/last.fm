import 'package:flutter/material.dart';

class ImageNetwork extends StatelessWidget {
  const ImageNetwork(
    this.imageUrl,{
    this.height = 70,
    this.width = 70,
    super.key,
  });

  final String? imageUrl;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    if(imageUrl == null || imageUrl!.isEmpty){
      return _emptyBox();
    }

    return Image.network(
      imageUrl!,
      height: height,
      width: width,
      errorBuilder: (BuildContext context, Object obj, _){
        return _emptyBox();
      },
    );
  }

  Widget _emptyBox(){
    return SizedBox(
      height: height,
      width: width,
    );
  }
}
