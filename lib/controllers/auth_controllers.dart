import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:online_bazar/consts/consts.dart';

import '../consts/firebase_consts.dart';

class AuthController extends GetxController {
  //login method
  Future<UserCredential?> loginMethod(email, password, context) async {
    UserCredential? userCredential;

    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //SIGNUP METHOD

  Future<UserCredential?> signupMethod(email, password, context) async {
    UserCredential? userCredential;

//must write password in correct format like using special character and other
//also email must be used in proper format in order to signup
    try {
      userCredential = await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print('Error creating user: ${e.message}');
      VxToast.show(context, msg: e.toString());
    }
    return userCredential;
  }

  //storing data into cloud
  storeUserData({name, password, email}) async {
    DocumentReference store =
        firestore.collection(userCollection).doc(currentUser!.uid);
    store.set(
        {'name': name, 'password': password, 'email': email, 'imgurl': ''});
  }

  //signout method
  signoutmethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}
