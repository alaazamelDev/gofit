import 'package:flutter/material.dart';
import 'package:gofit/screens/account_setup/pages/about_fragment.dart';
import 'package:gofit/screens/account_setup/pages/age_fragment.dart';
import 'package:gofit/screens/account_setup/pages/goal_fragment.dart';
import 'package:gofit/screens/account_setup/pages/height_fragment.dart';
import 'package:gofit/screens/account_setup/pages/weight_fragment.dart';

final List<Widget> accountPages = [
  AboutFragment(),
  AgeFragment(),
  WeightFragment(),
  HeightFragment(),
  GoalFragment(),
];
