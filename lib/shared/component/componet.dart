import 'package:course_project/shared/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget defaultTextField({
String? Function(String?)? validate,
  TextEditingController? controller,
  TextInputType? inputType,
  String? label,
  bool obscure=false,
}){
  return TextFormField(
    controller: controller,
    validator:validate ,
    keyboardType: inputType,
    obscureText: obscure,
    decoration:  InputDecoration(
        label: Text(
            label!
        ),
    ),

  );
}

Widget defaultElevatedBottom({
  required String? label,
  required Function()? onpressed,
}){
  return ElevatedButton(
    onPressed: onpressed,
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(
          const Color(0xff4458DB)),
      padding: MaterialStateProperty.all(
          EdgeInsets.zero),
      shape: MaterialStateProperty.all(
        RoundedRectangleBorder(
          // Change your radius here
          borderRadius: BorderRadius.circular(40),
        ),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 30,
        ),
        Expanded(
          child: Align(
            alignment: AlignmentDirectional.center,
            child: Text(
              label!,
              style: TextStyle(
                  fontFamily: Constant.regularText,
                  fontSize: 16),
            ),
          ),
        ),
        Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                "assets/icons/arrowicon.png",
              ),
              Image.asset(
                "assets/icons/right-arrow.png",
              ),
            ]),
      ],
    ),
  );
}

Future toastShow({
  required String msg,
}){
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.red,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}