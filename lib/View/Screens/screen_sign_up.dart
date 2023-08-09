import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vivelapp/Controller/RegistrationController.dart';
import 'package:vivelapp/View/Custom%20Widgets/custom_button.dart';
import 'package:vivelapp/View/Custom%20Widgets/custom_text_field.dart';
import 'package:vivelapp/View/Screens/screen_sign_in.dart';

class ScreenSignUp extends StatelessWidget {

  RegistrationController signupController = Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)),
        toolbarHeight: 10.h,
        backgroundColor: Colors.white,
        title: Text(
          'Sign Up',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            children: [
              CustomTextField(
                hintText: 'Enter Name', controller: signupController.firstNameController,
              ),
              CustomTextField(
                controller: signupController.emailController,
                hintText: 'Enter Email',
              ),
              CustomTextField(
                controller: signupController.phoneNumberController,
                hintText: 'Enter Phone Number',
              ),
              CustomTextField(
                controller: signupController.ageController,
                hintText: 'Enter Your Age',
              ),
              CustomTextField(
                controller: signupController.passwordController,
                hintText: 'Enter Password',
              ),
              CustomTextField(
                controller: signupController.confirmPasswordController,
                hintText: 'Confirm Password',
              ),
              CustomButton(
                buttonText: 'Sign Up',
                buttonColor: Colors.red,
                onPressed: () {
                  signupController.Signup();
                },
                textStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              ).marginSymmetric(vertical: 10.h),
              TextButton(
                  onPressed: () {
                    Get.to(ScreenSignIn());
                  }, child: Text('Already have an Account'))
            ],
          ),
        ),
      ),
    );
  }
}
