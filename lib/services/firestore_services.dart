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

  //get cart items
  static getCart(uid) {
    return firestore
        .collection(cartCollectio)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  //delete document
  static deleteDocument(docId) {
    return firestore.collection(cartCollectio).doc(docId).delete();
  }

  //get all chat messages
  static getChatmessages(docId) {
    return firestore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagesCollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }
}
