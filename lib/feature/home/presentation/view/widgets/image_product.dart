import 'package:cached_network_image/cached_network_image.dart';
import 'package:elevatetask/core/shared_widget/build_shimmer_shape.dart';
import 'package:flutter/material.dart';

class ImageProduct extends StatelessWidget {
  final String urlImage;
  const ImageProduct({super.key, required this.urlImage});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: double.infinity,
      fit: BoxFit.contain,
      imageUrl: urlImage,
      height: 80,
      placeholder: (context, url) =>
          const BuildShimmerShape(width: 100, height: 80),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
