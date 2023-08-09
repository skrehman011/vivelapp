import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:vivelapp/Models/Student.dart';
import 'package:vivelapp/View/Screens/screen_sign_in.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(FirebaseAuth.instance.currentUser!.uid.toString());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10.h,
        backgroundColor: Colors.white,
        title: Text(
          'Home Page',
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.w800, fontSize: 19),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signOut()
                    .then((value) => Get.offAll(ScreenSignIn()));
              },
              icon: Icon(
                Icons.logout,
                color: Colors.black,
              )),
        ],
        centerTitle: true,
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: FirebaseFirestore.instance
            .collection('users')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .get(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator());
          }

          // if (snapshot.hasError) {
          //   return Text("Error: ${snapshot.error}");
          // }
          //
          // if (!snapshot.hasData || snapshot.data == null) {
          //   return Text("No data available.");
          // }
          //
          // if (!snapshot.data!.exists) {
          //   return Text("Document does not exist.");
          // }

          var data = snapshot.data!.data() as Map<String, dynamic>;
          var user = Student.formMap(data);

          return ListTile(
            title: Text(' ${user.name},  ${user.age}'),
            subtitle: Text(' ${user.phone}'),
          );
        },
      ),
    );
  }
}
