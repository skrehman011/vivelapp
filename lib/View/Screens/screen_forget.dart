import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vivelapp/Controller/RegistrationController.dart';
import 'package:vivelapp/View/Custom%20Widgets/custom_button.dart';
import 'package:vivelapp/View/Custom%20Widgets/custom_text_field.dart';

class ScreenForget extends StatelessWidget {

  RegistrationController forgetController= Get.put( RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios, color: Colors.black,)),
        toolbarHeight: 10.h,
        backgroundColor: Colors.white,
        title: Text(
          'Email Verification',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            CustomTextField(
                controller: forgetController.emailController,
                hintText: 'Enter Email').marginSymmetric(vertical: 30.h),
            CustomButton(buttonText: 'Send Verification Email', buttonColor: Colors.red, onPressed: (){
              forgetController.forget();
            }, textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w800,
              fontSize: 20,
            ))
          ],
        ),
      ),
    );
  }
}
