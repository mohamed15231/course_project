import 'package:bloc/bloc.dart';
import 'package:course_project/model/login_models.dart';
import 'package:course_project/modules/login_screen/login-Screen_cubit/states_login.dart';
import 'package:course_project/shared/network/diohelper.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginScreenStates> {
  LoginCubit() : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  LoginModel? loginModel;
  void getData({
  required String email,
  required String password,
}) {
    emit(LoginGetDataLoadingState());
    DioHelper.postData(
      url: "http://alcaptin.com/api/login",
      data: {
        "email":email,
        "password":password,
      },
    ).then((value) {
      loginModel=LoginModel.fromJson(value.data);
      print(loginModel!.data!.name);
      emit(LoginGetDataSuccessState());
    }).catchError((error){
      print(error);
      emit(LoginGetDataErrorState());
    });
  }


}
