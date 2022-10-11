import 'package:flutter/material.dart';

class PageTitle extends StatelessWidget {
  const PageTitle({
    Key? key,
    required this.title,
    this.align = Alignment.centerLeft,
  }) : super(key: key);
  final String title;
  final Alignment align;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.2,
      child: Align(
        alignment: align,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).textTheme.titleMedium!.color,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}
