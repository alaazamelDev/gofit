import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';

class LabeledDivider extends StatelessWidget {
  const LabeledDivider({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          thickness: 1,
        )),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            label,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        const Expanded(child: Divider(thickness: 1)),
      ],
    );
  }
}
