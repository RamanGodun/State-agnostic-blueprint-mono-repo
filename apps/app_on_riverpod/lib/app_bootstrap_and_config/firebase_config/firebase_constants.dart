import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

///
abstract final class FirebaseConstants {
  ///--------------------------------
  //
  @pragma('vm:prefer-inline')
  const FirebaseConstants._();
  //

  /// 🧩 [usersCollection] — Firestore reference to the `users` collection
  /// 📦 Used for fetching and storing user-specific data
  static final CollectionReference<Map<String, dynamic>> usersCollection =
      FirebaseFirestore.instance.collection(
        'users',
      );

  /// 🧩 [fbAuth] — Firebase Authentication instance
  /// 📦 Provides access to Firebase user-related auth methods
  static final FirebaseAuth fbAuth = FirebaseAuth.instance;

  // 🧩 Extend with more collections as needed (e.g., 'tasks', 'chats', etc.)
}
