import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    Key? key,
    required this.onPressed,
    required this.actionTitle,
    required this.title,
  }) : super(key: key);

  final VoidCallback onPressed;
  final String actionTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        TextButton(
          onPressed: onPressed,
          child: const Text('See All'),
        ),
      ],
    );
  }
}
