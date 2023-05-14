import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NetworkOrSvgPicture extends StatelessWidget {
  final String imageUrl;
  final Color? svgColor;
  final double? height;
  final double? width;
  const NetworkOrSvgPicture({Key? key, required this.imageUrl,this.svgColor,this.height,this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(imageUrl,
      height: height,
      width: width,
      errorBuilder: (_,exception,stackTrace) => SvgPicture.network(
        imageUrl,
        colorFilter: (svgColor!=null) ? ColorFilter.mode(svgColor!, BlendMode.srcIn) : null,
        height: height,
        width: width,
      ),
    );
  }
}
