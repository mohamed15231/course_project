import 'package:bloc/bloc.dart';
import 'package:course_project/layout/cubit/layout_state.dart';
import 'package:course_project/model/placesmodel.dart';
import 'package:course_project/modules/calender/calender.dart';
import 'package:course_project/modules/favorite/favorite.dart';
import 'package:course_project/modules/home/home.dart';
import 'package:course_project/modules/location/location.dart';
import 'package:course_project/modules/person/person.dart';
import 'package:course_project/modules/places_screen/places_screen.dart';
import 'package:course_project/shared/constant/constant.dart';
import 'package:course_project/shared/network/diohelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<CubitStates>{
  AppCubit():super(CubitInitialState());

  static AppCubit get(context)=>BlocProvider.of(context);

  int currentIndex=2;


  List<BottomNavigationBarItem> items=[
    BottomNavigationBarItem(
      icon: Image.asset("assets/icons/home.png"),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Image.asset("assets/icons/fav.png"),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          Image.asset("assets/icons/location.png"),
          Image.asset("assets/icons/bag.png"),
        ],
      ),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Image.asset("assets/icons/calendar.png"),
      label: "",
    ),
    BottomNavigationBarItem(
      icon: Image.asset("assets/icons/avatar.png"),
      label: "",
    ),
  ];

  void changeScree(int index){
    currentIndex=index;
    emit(CubitChangeBottomNavState());
  }
  List<Widget> screen=[
    Home_Screen(),
    const FavoriteScreen(),
    Location_Screen(),
    const CalenderScreen(),
    const PersonScreen(),
  ];

  List<String> title=[
    "Tour",
    "favorite",
    "location",
    "calender",
    "person",
  ];

  PlacesModel? placesModel;
  
  void getPlacesData(){
    emit(GetPlacesLoadingState());
    DioHelper.getData(url: "http://alcaptin.com/api/places", ).then((value) {
      placesModel=PlacesModel.fromJson(value.data);
      print(placesModel!.data!.data![0].image);
      emit(GetPlacesSuccessState());
    }).catchError((error){
      print(error);
      emit(GetPlacesErrorState());

    });
  }

}