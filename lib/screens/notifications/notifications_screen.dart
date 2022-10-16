import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/screens/notifications/components/notification_card.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

// route builder
  static Route route() => MaterialPageRoute(
        builder: (context) => const NotificationsScreen(),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            splashRadius: 18,
            icon: SvgPicture.asset(
              kMenuSvg,
              color: Theme.of(context).textTheme.titleMedium!.color,
              width: 25,
              height: 25,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: defaultPadding),
            const _SectionDate(label: "Today"),
            const SizedBox(height: defaultPadding),
            const NotificationCard(
              title: "Congratulations",
              desciption: "You've been exercising for 2 hours",
              color: Colors.green,
              icon: Icons.check_box_rounded,
            ),
            NotificationCard(
              title: "New Workout is Available",
              desciption: "Check now and practice",
              color: Colors.blue.shade700,
              icon: Icons.add_box_rounded,
            ),
            const SizedBox(height: defaultPadding),
            const _SectionDate(label: "Yesterday"),
            const SizedBox(height: defaultPadding),
            const NotificationCard(
              title: "New Features are Available",
              desciption: "You can now set exercise remainder",
              color: Colors.red,
              icon: Icons.watch_later_rounded,
            ),
            const SizedBox(height: defaultPadding),
            const _SectionDate(label: "December 11, 2022"),
            const SizedBox(height: defaultPadding),
            const NotificationCard(
              title: "Verfication Successful",
              desciption: "Account verification complete",
              color: Colors.green,
              icon: Icons.check_box_rounded,
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionDate extends StatelessWidget {
  const _SectionDate({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .titleMedium!
          .copyWith(fontWeight: FontWeight.bold),
    );
  }
}
