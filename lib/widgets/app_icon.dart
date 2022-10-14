import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    Key? key,
    this.size = 30,
  }) : super(key: key);
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: defaultPadding * 0.25,
        horizontal: defaultPadding * 0.25,
      ),
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SvgPicture.asset(
          kDumbbellImage,
          color: AppColors.textLight,
        ),
      ),
    );
  }
}
