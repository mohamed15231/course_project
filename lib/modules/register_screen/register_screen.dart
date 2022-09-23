import 'package:course_project/layout/layout_screen.dart';
import 'package:course_project/modules/login_screen/login_screen.dart';
import 'package:course_project/modules/register_screen/register_cubit/register_cubit.dart';
import 'package:course_project/modules/register_screen/register_cubit/register_state.dart';
import 'package:course_project/shared/component/componet.dart';
import 'package:course_project/shared/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../shared/network/cache_helper.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    var nameController = TextEditingController();
    var phoneController = TextEditingController();
    var formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterScreenStates>(
        listener: (context, state) {
          if (state is RegisterGetDataErrorState) {
            toastShow(msg: "There's something wrong.");
          } else if (state is RegisterGetDataSuccessState) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LayoutScreen(),
                ));
            tokenValue=RegisterCubit.get(context).loginModel!.data!.accessToken;
            CacheHelper.postData(key: Constant.tokenKey, value:RegisterCubit.get(context).loginModel!.data!.accessToken);
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
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      const Image(
                          image: AssetImage("assets/images/login_logo.png")),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 520,
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
                                  height: 495.67,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Column(
                                      children: [
                                        Text("Sign Up",
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline1),
                                        defaultTextField(
                                            label: "Name",
                                            controller: nameController,
                                            inputType: TextInputType.name,
                                            validate: (value) {
                                              if (value!.isEmpty) {
                                                return "Name not must empty";
                                              }
                                              return null;
                                            }),
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
                                            obscure: true,
                                            label: "Password",
                                            controller: passwordController,
                                            inputType:
                                                TextInputType.visiblePassword,
                                            validate: (value) {
                                              if (value!.isEmpty ||
                                                  value.length < 5) {
                                                return "Password is not valid";
                                              }
                                              return null;
                                            }),
                                        defaultTextField(
                                            label: "Phone",
                                            controller: phoneController,
                                            inputType: TextInputType.phone,
                                            validate: (value) {
                                              if (value!.isEmpty) {
                                                return "Phone not must empty";
                                              }
                                              return null;
                                            }),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        ListTile(
                                          contentPadding: EdgeInsets.zero,
                                          minLeadingWidth: 0,
                                          leading: SizedBox(
                                            width: 10,
                                            height: 50,
                                            child: Checkbox(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      side: BorderSide(
                                                          width: 50)),
                                              value: RegisterCubit.get(context).checkBox,
                                              onChanged: (value) {
                                                RegisterCubit.get(context).changeCheckBox(value: value!);
                                              },
                                            ),
                                          ),
                                          title: RichText(
                                            text: const TextSpan(
                                                text: "I agree the",
                                                style: TextStyle(
                                                    color: Colors.black),
                                                children: [
                                                  TextSpan(
                                                      text:
                                                          " Terms & Conditions",
                                                      style: TextStyle(
                                                          color: Color(
                                                              0xff4458DB)))
                                                ]),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        defaultElevatedBottom(
                                          label: "Sign in",
                                          onpressed: () {
                                            if (formKey.currentState!
                                                .validate()) {
                                              RegisterCubit.get(context)
                                                  .getRegisterData(
                                                      firstName:
                                                          nameController.text,
                                                      email:
                                                          emailController.text,
                                                      password:
                                                          passwordController
                                                              .text);
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/icons/Facebook.png"),
                          const SizedBox(
                            width: 25,
                          ),
                          Image.asset("assets/icons/Google.png"),
                        ],
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
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
                                    builder: (context) => const LoginScreen(),
                                  ));
                            },
                            child: Text(
                              " Login",
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
