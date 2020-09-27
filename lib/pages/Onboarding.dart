import 'package:calendlio/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:sk_onboarding_screen/sk_onboarding_model.dart';
import 'package:sk_onboarding_screen/sk_onboarding_screen.dart';

class Onboarding extends StatelessWidget {
  final pages = [
    SkOnboardingModel(
        title: 'Welcome Onboard',
        description:
            'The place , hasslefree scheduling / managing your meetings',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/one.png'),
    SkOnboardingModel(
        title: 'Be Productive',
        description:
            'With calendlio , never be late in meetingd',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/two.png'),
    SkOnboardingModel(
        title: 'Save Time',
        description:
            'Create and Manage Meetings hasslefree !',
        titleColor: Colors.black,
        descripColor: const Color(0xFF929794),
        imagePath: 'assets/images/three.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SKOnboardingScreen(
        bgColor: Colors.white,
        themeColor: const Color(0xFFf74269),
        pages: pages,
        skipClicked: (value) {
          Navigator.pushReplacementNamed(context, "/register");
          Constants.prefs.setBool("isBoarded", true);
        },
        getStartedClicked: (value) {
          Navigator.pushReplacementNamed(context, "/register");
          Constants.prefs.setBool("isBoarded", true);

        },
      ),
    );
  }
}