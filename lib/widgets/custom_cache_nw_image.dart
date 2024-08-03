import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:haupcar_assignment/utils/const_colors.dart';
import 'package:haupcar_assignment/utils/size_config.dart';
import 'package:shimmer/shimmer.dart';

class CustomCachedNetworkImage extends StatelessWidget {
  const CustomCachedNetworkImage({
    required this.imageUrl,
    super.key,
  });
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: SizeConfig(context).getHorizontalSize(160),
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.contain,
          ),
        ),
      ),
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: ConstColors.buttonYellowColor.withOpacity(0.5),
        highlightColor: ConstColors.buttonYellowColor.withOpacity(0.2),
        child: SizedBox(
          height: SizeConfig(context).getHorizontalSize(160),
          width: double.infinity,
        ),
      ),
      errorWidget: (context, url, error) => SizedBox(
        height: SizeConfig(context).getHorizontalSize(160),
        width: double.infinity,
        child: const Center(
          child: Icon(Icons.error),
        ),
      ),
    );
  }
}
