import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

String iconsbasePath = 'assets/icons/';
String imagesbasePath = 'assets/images/';
String logobasePath = 'assets/logo/';

class LogoWidgets {
  static String logo = "${logobasePath}logo.png";
}

class IconWidgets {
  static String noImageFoundImage = "${iconsbasePath}image_not_found.png";
}

class ImageWidgets {
  // static String onboarding1Image = "${imagesbasePath}onboarding1.jpg";
}

class CommomImage extends StatelessWidget {
  final double? scale;
  final double? height;
  final double? width;
  final String image;
  final BoxFit? fit;
  final Color? color;
  final bool? isAssetImage;
  final bool? isNetworkImage;

  const CommomImage({
    Key? key,
    required this.image,
    this.scale,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.isAssetImage = false,
    this.isNetworkImage = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (isNetworkImage == true) {
      return cachedImage(
        image: image,
        color: color,
        fit: fit,
        height: height,
        width: width,
      );
    }
    return Image.asset(
      image,
      color: color,
      height: height,
      width: width,
      scale: scale,
      fit: fit,
    );
  }
}

/// cache image
CachedNetworkImage cachedImage({
  required String image,
  String? errorImage,
  Color? color,
  double? height,
  double? width,
  BoxFit? fit,
}) {
  return CachedNetworkImage(
    imageUrl: image,
    fit: fit,
    color: color,
    width: width,
    height: height,
    progressIndicatorBuilder: (context, url, downloadProgress) =>
        CircularProgressIndicator(value: downloadProgress.progress),
    errorWidget: (context, url, error) =>
        Image.asset(errorImage ?? IconWidgets.noImageFoundImage),
  );
}
