import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final String title;
  final int noOfMinutes;
  final String level;
  final bool isBookmarked;
  final String image;
  const ExerciseTile({
    Key? key,
    this.title = "",
    this.noOfMinutes = 1,
    this.level = "",
    this.isBookmarked = false,
    this.image = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tight(
        Size(MediaQuery.of(context).size.width, 140),
      ),
      padding: const EdgeInsets.only(left: 20),
      margin: const EdgeInsets.all(10),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          fit: BoxFit.cover,
          alignment: Alignment.centerRight,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
          image: AssetImage(
            image,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (title.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (noOfMinutes.toString().isNotEmpty || level.isNotEmpty)
                  Text(
                    "$noOfMinutes Minutes  |  $level",
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                Icon(
                  isBookmarked
                      ? Icons.bookmark
                      : Icons.bookmark_border_outlined,
                  color: Colors.white,
                  size: 26,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
