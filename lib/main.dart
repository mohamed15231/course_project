import 'package:bloc/bloc.dart';
import 'package:course_project/layout/cubit/layout_cubit.dart';
import 'package:course_project/layout/layout_screen.dart';
import 'package:course_project/modules/login_screen/login_screen.dart';
import 'package:course_project/modules/onboarding.dart';
import 'package:course_project/modules/splash_screen.dart';
import 'package:course_project/shared/constant/constant.dart';
import 'package:course_project/shared/flutter_bloc.dart';
import 'package:course_project/shared/network/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool? onBoardingEnd=await CacheHelper.getData(key: Constant.onBoardingKey);
  tokenValue=await CacheHelper.getData(key: Constant.tokenKey);

  Widget? screen;
  if(onBoardingEnd == true){
    if(tokenValue!=null){
      screen= LayoutScreen();
    }else{
      screen=const LoginScreen();
    }

  }else{
    screen=OnBoarding();
  }
  runApp( MyApp(screen: screen,));
}

class MyApp extends StatelessWidget {
   MyApp({Key? key,required this.screen}) : super(key: key);
  Widget screen;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocProvider(
          create: (BuildContext context) =>AppCubit(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              textTheme:  TextTheme(
                headline1: const TextStyle(
                    fontFamily: 'Lato-Bold.ttf',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
                caption: TextStyle(
                  fontFamily: 'Lato-Regular.ttf',
                  fontSize: 12.sp,
                ),
              ),
              appBarTheme: AppBarTheme(),
              primarySwatch: Colors.blue,
            ),
            home:Splash_Screen( screen: screen,),
          ),
        );
      },
    );
  }
}


