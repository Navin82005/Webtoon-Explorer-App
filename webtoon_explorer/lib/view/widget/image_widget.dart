import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:webtoon_explorer/core/conf/app_typography.dart';
import 'package:webtoon_explorer/view/widget/loader_widget.dart';

class ImageWidget extends StatelessWidget {
  final String image;
  final double? height;
  final double? width;
  const ImageWidget({super.key, required this.image, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      width: width ?? double.infinity,
      height: height ?? 250,
      imageUrl: image,
      fit: BoxFit.cover,
      placeholder: (context, url) => const LoaderWidget(),
      errorWidget: (context, url, error) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error,
            color: Colors.red,
          ),
          Text("Unable to load media", style: AppTypography.subHeading1),
        ],
      ),
    );
  }
}
