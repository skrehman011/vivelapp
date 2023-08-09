import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vivelapp/Models/Student.dart';
import 'package:vivelapp/View/Screens/screen_home.dart';

class RegistrationController extends GetxController {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  void Signup() async {
    String firstName = firstNameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();
    String age = ageController.text.trim();
    String phone = phoneNumberController.text.trim();

    if (firstName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty ||
        age.isEmpty ||
        phone.isEmpty) {
      Get.snackbar('Alert', 'Fill all the field');
    } else {
      FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.snackbar('Success', 'User Successfully Registered');
        emailController.clear();
        passwordController.clear();
        phoneNumberController.clear();
        ageController.clear();
        confirmPasswordController.clear();
        firstNameController.clear();
        lastNameController.clear();

        Student user = Student(
          id: value.user!.uid,
          email: email,
          password: password,
          name: firstName,
          age: int.tryParse(age) ?? 0,
          phone: int.tryParse(phone) ?? 0,
        );

        FirebaseFirestore.instance
            .collection('users')
            .doc(user.id)
            .set(user.toMap())
            .then((value) {
          Get.snackbar('Alert', 'Successfully Data Stored');
        });

        print(value.user!.email.toString());
      }).catchError((error) {
        Get.snackbar('Alert', error.toString());
      });
    }
  }

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String phone = phoneNumberController.text.trim();
    if (email.isEmpty || password.isEmpty || phone.isEmpty) {
      Get.snackbar("Alert", "Please Fill all the Field");
    } else {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
        Get.snackbar("Success", "User Login");
        Get.offAll(ScreenHome());
        print(value.user!.email.toString());
      }).catchError((error) {
        Get.snackbar("Error", error.toString());
      });
    }
  }

  Future<void> forget() async {
    String email = emailController.text.trim();
    if (email.isNotEmpty) {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: email)
          .catchError((error) {
        Get.snackbar('Alert', error.toString());
      });
    } else {
      Get.snackbar('title', 'Enter your Email');
    }
  }
}
