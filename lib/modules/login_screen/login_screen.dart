import 'package:course_project/layout/layout_screen.dart';
import 'package:course_project/modules/login_screen/login-Screen_cubit/cubit_login.dart';
import 'package:course_project/modules/login_screen/login-Screen_cubit/states_login.dart';
import 'package:course_project/modules/register_screen/register_screen.dart';
import 'package:course_project/shared/constant/constant.dart';
import 'package:course_project/shared/network/cache_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

import '../../shared/component/componet.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginScreenStates>(
        listener: (context, state) {
          if (state is LoginGetDataErrorState) {
            toastShow(
              msg: "email or password is not valid",
            );
          } else if (state is LoginGetDataSuccessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  LayoutScreen(),
                ));
            CacheHelper.postData(key: Constant.tokenKey, value:LoginCubit.get(context).loginModel!.data!.accessToken);
          }
        },
        builder: (context, state) {
          return Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: AlignmentDirectional.topEnd,
                    end: AlignmentDirectional.bottomEnd,
                    colors: [
                      Color(0xff4458DB),
                      Color(0xffB444DB),
                    ]),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const Image(
                          image: AssetImage("assets/images/login_logo.png")),
                      const SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 400,
                        width: 335,
                        child: Stack(
                          alignment: FractionalOffset.bottomCenter,
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topCenter,
                              child: Image.asset(
                                "assets/images/background.png",
                                width: 272.58,
                                height: 315.67,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10.0),
                              child: Align(
                                alignment: AlignmentDirectional.topCenter,
                                child: Image.asset(
                                  "assets/images/top.png",
                                  width: 301.58,
                                  height: 315.67,
                                ),
                              ),
                            ),
                            Form(
                              key: formKey,
                              child: Container(
                                  width: 335,
                                  height: 380.67,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(30.0),
                                    child: Column(
                                      children: [
                                        Text("Sign In",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1),
                                        defaultTextField(
                                            label: "Email",
                                            controller: emailController,
                                            inputType:
                                                TextInputType.emailAddress,
                                            validate: (value) {
                                              if (value!.isEmpty ||
                                                  !value.contains('@')) {
                                                return "Email is not valid";
                                              }
                                              return null;
                                            }),
                                        defaultTextField(
                                            label: "Password",
                                            controller: passwordController,
                                            obscure: true,
                                            inputType:
                                                TextInputType.visiblePassword,
                                            validate: (value) {
                                              if (value!.isEmpty ||
                                                  value.length < 6) {
                                                return "Password is not valid";
                                              }
                                              return null;
                                            }),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15.0),
                                            child: InkWell(
                                              child: Text(
                                                "Forgot password?",
                                                style: TextStyle(
                                                    color: Color(0xff4458DB),
                                                    fontFamily:
                                                        Constant.regularText),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        defaultElevatedBottom(
                                          label: "Sign in",
                                          onpressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              LoginCubit.get(context).getData(
                                                  email: emailController.text,
                                                  password:
                                                      passwordController.text);
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 100,
                      ),
                      Align(
                        alignment: AlignmentDirectional.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/icons/Facebook.png"),
                            const SizedBox(
                              width: 25,
                            ),
                            Image.asset("assets/icons/Google.png"),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an account? ",
                            style: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(color: Colors.white),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ));
                            },
                            child: Text(
                              "Sign up",
                              style: Theme.of(context)
                                  .textTheme
                                  .caption!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
