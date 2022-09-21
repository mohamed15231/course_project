import 'package:course_project/model/register_model.dart';
import 'package:course_project/modules/register_screen/register_cubit/register_state.dart';
import 'package:course_project/shared/network/diohelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterScreenStates> {
  RegisterCubit() : super(RegisterScreenInitialState());

  static RegisterCubit get(context) => BlocProvider.of(context);
  RegisterModel? registerModel;

  void getRegisterData({
  required String firstName,
  required String email,
  required String password,
}) {
    emit(RegisterGetDataLoadingState());
    DioHelper.postData(
      url: "http://alcaptin.com/api/register",
      data: {
        "first_name":firstName,
        "last_name":"tarek",
        "email":email,
        "password":password,
        "age":"20",
        "gender":"male",
      },
    ).then((value) {
      print(value.data);
      registerModel=RegisterModel.fromJson(value.data);
      print(registerModel!.data!.name);
      emit(RegisterGetDataSuccessState());
    }).catchError((error){
      print(error);
      emit(RegisterGetDataErrorState());
    });
  }

  bool checkBox = false;
  void changeCheckBox({
    required bool value,
  }){
    checkBox=value;
    emit(RegisterChangeCheckBoxState());
  }
}
