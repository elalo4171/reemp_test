import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// This widget return a custom icon
/// if the icon is a png file, return a Image.asset
/// if the icon is a svg file, return a SvgPicture.asset
class IconsCustom extends StatelessWidget {
  const IconsCustom({super.key, required this.icon, required this.size});
  final String icon;
  final double size;
  @override
  Widget build(BuildContext context) {
    if (icon.contains(".png")) {
      return Image.asset(
        icon,
        width: size,
        height: size,
      );
    } else {
      return SvgPicture.asset(
        icon,
        width: size,
        height: size,
      );
    }
  }
}
