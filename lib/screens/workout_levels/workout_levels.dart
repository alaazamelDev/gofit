import 'package:flutter/material.dart';
import 'package:gofit/config/constants.dart';
import 'package:gofit/domain/enums.dart';
import 'package:gofit/screens/workout_levels/exercise_tile.dart';
import 'package:gofit/widgets/custom_chip.dart';

class WorkoutLevel extends StatefulWidget {
  const WorkoutLevel({super.key});

  @override
  State<WorkoutLevel> createState() => _WorkoutLevelState();
}

class _WorkoutLevelState extends State<WorkoutLevel> {
  Level active = Level.beginner;

  List<Map<String, dynamic>> tilesData = [
    {
      "title": "Squat Movement Exercise",
      "durationInMinutes": 6,
      "levelType": "Beginner",
      "image": kIntro2Image
    },
    {
      "title": "Fully Body Stretching",
      "durationInMinutes": 5,
      "levelType": "Beginner",
      "image": kIntro1Image,
      "isBookmarked": true
    },
    {
      "title": "Yoga",
      "durationInMinutes": 10,
      "levelType": "Beginner",
      "image": kIntro3Image
    },
    {
      "title": "Fully Body Stretching",
      "durationInMinutes": 5,
      "levelType": "Beginner",
      "image": kIntro1Image,
      "isBookmarked": true
    },
    {
      "title": "Squat Movement Exercise",
      "durationInMinutes": 6,
      "levelType": "Beginner",
      "image": kIntro2Image
    },
  ];

  setActiveState(Level activeState) {
    setState(() {
      active = activeState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Workout Levels",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: Ink(
              decoration:
                  BoxDecoration(shape: BoxShape.circle, border: Border.all()),
              child: const Icon(Icons.more_horiz),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomChip(
                      text: "Beginner",
                      active: active == Level.beginner,
                      onTap: () => setActiveState(Level.beginner),
                    ),
                    CustomChip(
                      text: "Intermediate",
                      active: active == Level.intermediate,
                      onTap: () => setActiveState(Level.intermediate),
                    ),
                    CustomChip(
                      text: "Advanced",
                      active: active == Level.advanced,
                      onTap: () => setActiveState(Level.advanced),
                    )
                  ],
                ),
              ),
              ...tilesData
                  .map(
                    (ele) => ExerciseTile(
                      title: ele["title"],
                      noOfMinutes: ele["durationInMinutes"],
                      level: ele["levelType"],
                      isBookmarked: ele["isBookmarked"] ?? false,
                      image: ele["image"],
                    ),
                  )
                  .toList()
            ],
          ),
        ),
      ),
    );
  }
}
