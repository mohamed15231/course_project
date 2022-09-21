import 'package:course_project/modules/login_screen/login_screen.dart';
import 'package:course_project/shared/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:onboarding/onboarding.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../model/onboardingmodel.dart';
import '../shared/network/cache_helper.dart';

class OnBoarding extends StatefulWidget {
  OnBoarding({Key? key}) : super(key: key);

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  PageController? pageController = PageController();
  bool isEnd = false;

  List<OnBoardingModel> listOnBoarding = [
    OnBoardingModel(
        "assets/images/first_screen_onboarding.png",
        "assets/icons/onboarding_logo.png",
        "Plan Your Trip",
        "Plan your trip, choose your destination.\n Pick the best place for your holiday."),
    OnBoardingModel(
        "assets/images/second_screen _onboarding.png",

        "assets/icons/onboarding_logo.png",
        "Select The Date",
        "Select the day, book your ticket. We give you the best price. We guarantied!"),
    OnBoardingModel(
        "assets/images/third_screen_onboarding.png",
        "assets/icons/onboarding_logo.png",
        "Enjoy Your Trip",
        "Enjoy your holiday! don't forget to take a photo and share to the world"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) => defaultBuildItem(
                index: index,
                onBoardingModel: listOnBoarding[index],
                context: context),
            controller: pageController,
            itemCount: listOnBoarding.length,
            onPageChanged: (value) {}),
      ),
    );
  }

  Widget defaultBuildItem(
      {required OnBoardingModel onBoardingModel,
      required int index,
      required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 17, bottom: 56),
          child: Image.asset(onBoardingModel.logo),
        ),
        Expanded(child: Image.asset(onBoardingModel.image)),
        SizedBox(
          height: 3.h,
        ),
        Text(
          onBoardingModel.title,
          style: Theme.of(context).textTheme.headline1,
        ),
        const SizedBox(
          height: 18,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: Text(
            onBoardingModel.subTitle,
            style: Theme.of(context).textTheme.caption!.copyWith(height: 1.5),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        index == 2
            ? TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                  CacheHelper.postData(key: Constant.onBoardingKey, value: true);

                },
                child: Text(
                  "let's go!",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: const Color(0xff4458DB),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                    ),
                    child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),

                            ),

                          );
                          CacheHelper.postData(key: Constant.onBoardingKey, value: true);
                        },
                        child: const Text(
                          "SKIP",
                          style: TextStyle(
                            color: Color(0xff111111),
                            fontFamily:'Lato-Regular.ttf',
                          ),
                        )),
                  ),
                  SmoothPageIndicator(
                    controller: pageController!,
                    count: 3,
                    effect: const WormEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      spacing: 8.0,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 16.0,
                    ),
                    child: TextButton(
                        onPressed: () {
                          pageController!.nextPage(
                              duration: const Duration(
                                milliseconds: 750,
                              ),
                              curve: Curves.fastLinearToSlowEaseIn);
                        },
                        child: const Text(
                          "NEXT",
                          style: TextStyle(
                            fontFamily: 'Lato-Regular.ttf',
                          ),
                        )),
                  ),
                ],
              )
      ],
    );
  }
}
