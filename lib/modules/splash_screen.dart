
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';

import 'onboarding.dart';

class Splash_Screen extends StatelessWidget {
  Splash_Screen({Key? key,required this.screen}) : super(key: key);
  Widget screen;


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreenView(
        navigateRoute: screen,
        imageSrc: "assets/icons/Logo.png",
        backgroundColor: Color(0xff4458DB),
        duration: 8,
      );
  }
}
