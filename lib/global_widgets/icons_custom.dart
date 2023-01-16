import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class IconsCustom extends StatelessWidget {
  const IconsCustom({super.key, required this.icon, required this.size});
  final String icon;
  final double size;
  @override
  Widget build(BuildContext context) {
    if(icon.contains(".png")){
      return Image.asset(icon, width: size, height: size,);
    }else {
      return SvgPicture.asset(icon, width: size, height: size,);
    }
  }
}