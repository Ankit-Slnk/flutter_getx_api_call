import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_api_call/utils/app_assets.dart';
import 'package:flutter_getx_api_call/widgets/progress_bar.dart';

class ImageLoader extends StatelessWidget {
  final String url;
  final String placeholder;
  final BoxFit fit;
  const ImageLoader({
    super.key,
    required this.url,
    this.placeholder = placeholderImg,
    this.fit = BoxFit.cover,
  });

  @override
  Widget build(BuildContext context) {
    return (url == "null" || url.trim() == "")
        ? Image.asset(placeholder)
        : CachedNetworkImage(
            imageUrl: url,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: imageProvider,
                  fit: fit,
                ),
              ),
            ),
            placeholder: (context, url) => const ProgressBar(),
            errorWidget: (context, url, error) => Image.asset(imageNotFoundImg),
          );
  }
}
