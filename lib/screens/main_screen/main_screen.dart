import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/screens/bookmarks/my_bookmarks_screen.dart';
import 'package:gofit/screens/main_screen/discover/discover_page.dart';
import 'package:gofit/screens/main_screen/home/home_page.dart';
import 'package:gofit/screens/main_screen/insight/insight_page.dart';
import 'package:gofit/screens/main_screen/profile/profile_page.dart';
import 'package:gofit/widgets/app_icon.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

// route builder
  static Route route() => MaterialPageRoute(
        builder: (context) => MainScreen(),
      );

  final ValueNotifier<int> pageIndex = ValueNotifier(0);

  final List<Map<String, dynamic>> fragments = [
    {
      "index": 0,
      "label": "Home",
      "iconAsset": kHomeSvg,
      "widget": HomePage(),
    },
    {
      "index": 1,
      "label": "Discover",
      "iconAsset": kDiscoverSvg,
      "widget": const DiscoverPage(),
    },
    {
      "index": 2,
      "label": "Insight",
      "iconAsset": kInsightSvg,
      "widget": const InsightPage(),
    },
    {
      "index": 3,
      "label": "Profile",
      "iconAsset": kProfileSvg,
      "widget": const ProfilePage(),
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AppIcon(),
            const SizedBox(width: defaultPadding * 0.5),
            ValueListenableBuilder<int>(
              valueListenable: pageIndex,
              builder: (context, index, _) {
                if (index == 0) {
                  return Text(
                    "Gofit",
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(fontWeight: FontWeight.bold),
                  );
                }
                return Text(
                  fragments[index]['label'],
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontWeight: FontWeight.bold, letterSpacing: 1.2),
                );
              },
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              kNotificationSvg,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            splashRadius: 18,
          ),
          IconButton(
            onPressed: () {
              Navigator.push(context, MyBookmarksScreen.route());
            },
            icon: SvgPicture.asset(
              kBookmarkOutlinedSvg,
              color: Theme.of(context).textTheme.bodyLarge!.color,
            ),
            splashRadius: 18,
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: fragments
                    .map<Widget>(
                      (fragment) => ValueListenableBuilder<int>(
                        valueListenable: pageIndex,
                        builder: (context, currentIndex, _) {
                          return _BottomAppBarItem(
                            iconAsset: fragment['iconAsset'],
                            label: fragment['label'],
                            isSelected: currentIndex == fragment['index'],
                            itemIndex: fragment['index'],
                            onPressed: (ind) {
                              pageIndex.value = ind;
                            },
                          );
                        },
                      ),
                    )
                    .toList()),
          ),
        ),
      ),
      body: ValueListenableBuilder<int>(
        valueListenable: pageIndex,
        builder: (context, index, child) {
          return fragments[index]['widget'];
        },
      ),
    );
  }
}

class _BottomAppBarItem extends StatelessWidget {
  const _BottomAppBarItem({
    Key? key,
    required this.iconAsset,
    required this.label,
    required this.isSelected,
    required this.itemIndex,
    required this.onPressed,
  }) : super(key: key);

  final String iconAsset;
  final String label;
  final bool isSelected;
  final int itemIndex;
  final Function(int) onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        onPressed(itemIndex);
      },
      child: Ink(
        child: Column(
          children: [
            Flexible(
              child: SvgPicture.asset(
                iconAsset,
                color: isSelected
                    ? AppColors.secondary
                    : Theme.of(context).hintColor,
              ),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: isSelected
                        ? AppColors.secondary
                        : Theme.of(context).hintColor,
                    fontWeight: isSelected ? FontWeight.bold : null,
                  ),
            )
          ],
        ),
      ),
    );
  }
}
