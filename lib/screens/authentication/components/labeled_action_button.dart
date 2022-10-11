import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';

class LabeledActionButton extends StatelessWidget {
  const LabeledActionButton({
    Key? key,
    required this.queryText,
    required this.actionText,
    required this.onAction,
  }) : super(key: key);
  final String queryText;
  final String actionText;
  final VoidCallback onAction;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          queryText,
          style: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: AppColors.textFaded),
        ),
        const SizedBox(width: defaultPadding * 0.5),
        GestureDetector(
          onTap: onAction,
          child: Text(
            actionText,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                color: AppColors.secondary, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
