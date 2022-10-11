import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';

class SocialMeidaLoginButton extends StatelessWidget {
  const SocialMeidaLoginButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.iconAsset,
    this.iconSize = 30,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String label;
  final String iconAsset;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          width: 1,
          color: Theme.of(context).dividerColor,
        ),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconAsset,
              width: iconSize,
              height: iconSize,
            ),
            const SizedBox(width: defaultPadding),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w600, letterSpacing: 1.2),
            ),
          ],
        ),
      ),
    );
  }
}
