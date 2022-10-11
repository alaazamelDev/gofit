import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hint,
    this.maxLines = 1,
    this.validator,
    required this.controller,
    this.prefixWidget,
    this.suffixIcon,
    this.padding,
  }) : super(key: key);
  final String hint;
  final int maxLines;
  final String Function(String?)? validator;
  final TextEditingController controller;
  final Widget? prefixWidget;
  final Widget? suffixIcon;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
          contentPadding: padding ??
              const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding * 1.5,
              ),
          fillColor: Theme.of(context).cardColor,
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: AppColors.secondary,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              style: BorderStyle.none,
            ),
          ),
          hintText: hint,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyMedium!
              .copyWith(color: Theme.of(context).hintColor),
          prefixIcon: prefixWidget,
          suffixIcon: suffixIcon),
    );
  }
}
