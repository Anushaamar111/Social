// import 'package:cloud_firestore/cloud_firestore.dart';

// import 'package:firebase_auth/firebase_auth.dart';

// class FirestoreDatabase {
//   //The database stores posts fron users.
//   //a message, email of user, timestamp

// //current logged in user
//   User? user = FirebaseAuth.instance.currentUser;

//   //get collection of posts from firebase
//   final CollectionReference posts =
//       FirebaseFirestore.instance.collection('Posts');
//   //post a message
//   Future<void> addPost(String message) {
//     return posts.add({
//       'email': user!.email,
//       'message': message,
//       'Timestamp': Timestamp.now(),
//     });
//   }

//   //read posts from database
//   Stream<QuerySnapshot<Map<String, dynamic>>> getPostsStream() {
//     final postStream = FirebaseFirestore.instance
//         .collection('Posts')
//         .orderBy(Timestamp, descending: true)
//         .snapshots();

//     return postStream;
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';

class FirestoreDatabase {
  // The database stores posts from users.
  // a message, email of user, timestamp

  // current logged in user
  User? user = FirebaseAuth.instance.currentUser;

  // get collection of posts from firebase
  final CollectionReference posts =
      FirebaseFirestore.instance.collection('Posts');

  // post a message
  Future<void> addPost(String message,
      {String? imageUrl, String? videoUrl}) async {
    await posts.add({
      'email': user!.email,
      'message': message,
      'Timestamp': Timestamp.now(),
      'imageUrl': imageUrl,
      'videoUrl': videoUrl,
    });
  }

  // read posts from database
  Stream<QuerySnapshot<Map<String, dynamic>>> getPostsStream() {
    final postStream = FirebaseFirestore.instance
        .collection('Posts')
        .orderBy('Timestamp', descending: true)
        .snapshots();

    return postStream;
  }
}
