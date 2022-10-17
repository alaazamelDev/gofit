import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String text;
  final bool active;
  final void Function() onTap;
  const CustomChip(
      {Key? key, required this.text, required this.active, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: InkWell(
        onTap: onTap,
        child: Chip(
          backgroundColor: active
              ? Theme.of(context).colorScheme.primary
              : Colors.transparent,
          side: BorderSide(color: Theme.of(context).colorScheme.primary),
          labelPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
          labelStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
              color: active
                  ? Colors.white
                  : Theme.of(context).colorScheme.primary),
          label: Text(
            text,
          ),
        ),
      ),
    );
  }
}
