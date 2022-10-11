import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';

class SquaredSocialButton extends StatelessWidget {
  const SquaredSocialButton({
    Key? key,
    required this.onPressed,
    required this.iconAsset,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String iconAsset;
  final double iconSize = 30;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(8),
      child: Ink(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Theme.of(context).hintColor,
            width: 0.1,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding * 1.5,
            vertical: defaultPadding * 0.75,
          ),
          child: SvgPicture.asset(
            iconAsset,
            width: iconSize,
            height: iconSize,
          ),
        ),
      ),
    );
  }
}
