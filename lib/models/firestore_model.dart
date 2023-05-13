import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_files/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirestoreUserData {
  Map<String, dynamic> data;

  FirestoreUserData({required this.data});

  static setData(CurrentUser user, String uid) async {
    var db = FirebaseFirestore.instance;
    var UserData = await db.collection(uid).doc("profile").set({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'phoneNumber': user.phoneNumber,
      'email': user.email,
      'profilePicture': user.profilePicture,
      'lastUpdated': DateTime.now().toIso8601String(),
    });
  }

  static setOrders(CurrentUser user, String uid) async {
    var db = FirebaseFirestore.instance;

    var UserData = await db.collection(uid).doc("orders").set({
      'data': user.orders,
    });
  }

  static setFavorites(CurrentUser user, String uid) async {
    var db = FirebaseFirestore.instance;

    var UserData = await db.collection(uid).doc("favorites").set({
      'data': user.fav,
    });
  }

  static setMyCart(CurrentUser user, String uid) async {
    var db = FirebaseFirestore.instance;

    var UserData = await db.collection(uid).doc("cart").set({
      'data': user.cart,
    });
  }

  static getProfileData(String uid) async {
    var db = FirebaseFirestore.instance;
    var UserData = await db.collection(uid).doc("profile").get();
    log(UserData.data().toString());
    return UserData.data();
  }

  static getOrders(String uid) async {
    var db = FirebaseFirestore.instance;
    var UserData = await db.collection(uid).doc("orders").get();
    log(UserData.data().toString());
    return UserData.data()!['data'] ?? [];
  }

  static getFavorites(String uid) async {
    var db = FirebaseFirestore.instance;
    var UserData = await db.collection(uid).doc("favorites").get();
    log(UserData.data().toString());
    return UserData.data()!['data'] ?? [];
  }

  static getMyCart(String uid) async {
    var db = FirebaseFirestore.instance;
    var UserData = await db.collection(uid).doc("cart").get();
    log(UserData.data().toString());
    return UserData.data()!['data'] ?? [];
  }
}
