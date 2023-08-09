import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vivelapp/Controller/RegistrationController.dart';
import 'package:vivelapp/View/Custom%20Widgets/custom_button.dart';
import 'package:vivelapp/View/Custom%20Widgets/custom_text_field.dart';
import 'package:vivelapp/View/Screens/screen_forget.dart';
import 'package:vivelapp/View/Screens/screen_home.dart';
import 'package:vivelapp/View/Screens/screen_sign_up.dart';

class ScreenSignIn extends StatelessWidget {

  RegistrationController signinController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        backgroundColor: Colors.white,
        title: Text(
          'Sign In',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          children: [
            CustomTextField(
                controller:signinController.emailController ,
                hintText: 'Enter Email'),
            CustomTextField(
                controller: signinController.phoneNumberController,
                hintText: 'Enter Phone Number'),
            CustomTextField(
              controller: signinController.passwordController,
                hintText: 'Enter Password'),
            CustomButton(
                buttonText: 'Sign In',
                buttonColor: Colors.red,
                onPressed: () {
                  signinController.login();
                },
                textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                )).marginSymmetric(vertical: 10.h),
            TextButton(
                onPressed: () {
                  Get.to(ScreenSignUp());
                }, child: Text('Create an Account')),
            TextButton(
                onPressed: () {
                  Get.to(ScreenForget());
                }, child: Text('Forget Password')),
          ],
        ),
      ),
    );
  }
}
