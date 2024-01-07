import 'package:online_bazar/consts/firebase_consts.dart';

class FirestoreServices {
  static getUser(uid) {
    //get users data
    return firestore
        .collection(userCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get products according to category
  static getproduct(category) {
    return firestore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }
}