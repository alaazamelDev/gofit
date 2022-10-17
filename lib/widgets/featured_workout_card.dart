import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/config/helper.dart';
import 'package:gofit/config/theme.dart';
import 'package:gofit/domain/models/workout.dart';

class FeaturedWorkoutCard extends StatelessWidget {
  const FeaturedWorkoutCard({
    Key? key,
    required this.workout,
    required this.onBookmarkPressed,
    this.isSquared = false,
    this.hideBookmarkButton = false,
    this.borderRadius,
  }) : super(key: key);

  final Function(int) onBookmarkPressed;
  final Workout workout;
  final bool isSquared;
  final bool hideBookmarkButton;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(24),
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                end: Alignment.topCenter,
                begin: Alignment.bottomCenter,
                colors: [
                  Colors.black.withOpacity(0.8),
                  Colors.transparent,
                ],
              ),
            ),
            child: Image.asset(
              workout.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            bottom: isSquared
                ? defaultPadding
                : (MediaQuery.of(context).size.height * 0.3) * 0.1,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isSquared ? defaultPadding : defaultPadding * 2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.title!,
                    style: isSquared
                        ? Theme.of(context).textTheme.titleSmall!.copyWith(
                              color: AppColors.textLight,
                              fontWeight: FontWeight.bold,
                            )
                        : Theme.of(context).textTheme.titleLarge!.copyWith(
                              color: AppColors.textLight,
                              fontWeight: FontWeight.bold,
                            ),
                  ),
                  SizedBox(
                    height: isSquared
                        ? defaultPadding * 0.25
                        : defaultPadding * 0.5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${workout.duration} minutes  |  ${Helper.getLevelLabel(workout.level!)}",
                        style: isSquared
                            ? Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColors.textFaded,
                                  fontSize: 10,
                                )
                            : Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: AppColors.textFaded),
                      ),
                      if (!hideBookmarkButton) ...[
                        const SizedBox(width: defaultPadding * 0.5),
                        GestureDetector(
                          onTap: () {
                            onBookmarkPressed(workout.id!);
                          },
                          child: SvgPicture.asset(
                            workout.isBookmarked
                                ? kBookmarkFilledSvg
                                : kBookmarkOutlinedSvg,
                            color: AppColors.textFaded,
                            width: 20,
                            height: 20,
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
