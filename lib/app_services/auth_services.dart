import 'package:get/get.dart';
// import 'dart:async';
// import 'package:e_book/commanWidget/custom_snackbar.dart';
// import 'package:e_book/utils/const_utils.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/app_text.dart';
// import '../model/apiModel/firebaseModel/sign_up_model.dart';

class AuthSetvices extends GetxController {
  // bool _authLoader = false;

  // bool get authLoader => _authLoader;

  // set authLoader(bool authLoader) {
  //   _authLoader = authLoader;
  //   update();
  // }

  // final FirebaseAuth _auth = FirebaseAuth.instance;

  // Future<User?> signUp({required SignUpModel signUpModel}) async {
  //   try {
  //     authLoader = true;
  //     final UserCredential userCredential =
  //         await _auth.createUserWithEmailAndPassword(
  //       email: signUpModel.email ?? "",
  //       password: signUpModel.password ?? "",
  //     );

  //     await _auth.currentUser!.sendEmailVerification();
  //     showSnackBar(
  //       message: "Verification link sent to your gmail address.",
  //     );

  //     await Future.delayed(const Duration(seconds: 5));
  //     checkEmailVerified();

  //     authLoader = false;
  //     return userCredential.user;
  //   } on FirebaseAuthException catch (e) {
  //     logs(name: "AUTH EXCEPTION", e.code);

  //     showSnackBar(
  //       message: e.code.replaceAll("-", " "),
  //     );

  //     authLoader = false;
  //     return null;
  //   } finally {
  //     authLoader = false;
  //   }
  // }

  // checkEmailVerified() async {
  //   Timer? timer;
  //   timer = Timer.periodic(const Duration(seconds: 3), (_) async {
  //     await FirebaseAuth.instance.currentUser?.reload();

  //     final data = FirebaseAuth.instance.currentUser!.emailVerified;

  //     if (data) {
  //       Get.back();
  //       timer?.cancel();
  //     }
  //   });
  // }
}

RegistrationDialog() {
  Get.dialog(
      // barrierDismissible: false,
      Dialog(
    backgroundColor: Colors.transparent,
    child: WillPopScope(
      onWillPop: () async => true,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Center(
              child: AppText(
                'Check your \n Email',
                textAlign: TextAlign.center,
                fontSize: 20,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Center(
                child: Text(
                  'We have sent you a Email on  \${_auth.currentUser?.email}',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Center(child: CircularProgressIndicator()),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0),
              child: Center(
                child: Text(
                  'Verifying email....',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 57),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ElevatedButton(
                child: const Text('Resend'),
                onPressed: () {
                  try {
                    // FirebaseAuth.instance.currentUser
                    //     ?.sendEmailVerification();
                  } catch (e) {
                    debugPrint('$e');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    ),
  ));
}
