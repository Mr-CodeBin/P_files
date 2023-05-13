import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:engage_files/models/firestore_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';

class CurrentUser {
  String firstName;
  String lastName;
  int phoneNumber;
  String email;
  String? profilePicture;
  DateTime lastUpdated;
  List<dynamic> fav;
  List<dynamic> cart;
  List<dynamic> orders;

  static CurrentUser? currentUser;
  static String? currentUserUid;
  CurrentUser({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    this.profilePicture,
    required this.lastUpdated,
    required this.fav,
    required this.cart,
    required this.orders,
  });

  static fromJSON(Map<String, dynamic> data) {
    return CurrentUser(
      firstName: data['firstName'],
      lastName: data['lastName'],
      phoneNumber: data['phoneNumber'],
      email: data['email'],
      profilePicture: data['profilePicture'],
      lastUpdated: data['lastUpdated'],
      fav: data['fav'],
      cart: data['cart'],
      orders: data['orders'],
    );
  }

  static getCurrentUser() async {
    if (await FirebaseAuth.instance.currentUser?.uid == null) {
      return null;
    }
    String uid = await FirebaseAuth.instance.currentUser!.uid;
    currentUserUid = uid;
    Map<String, dynamic> data = await FirestoreUserData.getProfileData(uid);
    List<dynamic> fav = await FirestoreUserData.getFavorites(uid);
    List<dynamic> cart = await FirestoreUserData.getMyCart(uid);
    List<dynamic> orders = await FirestoreUserData.getOrders(uid);
    data['lastUpdated'] = DateTime.parse(data['lastUpdated']);
    data['phoneNumber'] = data['phoneNumber'];
    data['fav'] = fav;
    data['cart'] = cart;
    data['orders'] = orders;
    log(data.toString());
    currentUser = CurrentUser.fromJSON(data);
  }

  static updateProfile(CurrentUser user) async {
    var db = FirebaseFirestore.instance;
    var UserData = await db.collection(currentUserUid!).doc("profile").update({
      'firstName': user.firstName,
      'lastName': user.lastName,
      'phoneNumber': user.phoneNumber,
      'email': user.email,
      'profilePicture': user.profilePicture,
      'lastUpdated': DateTime.now().toIso8601String(),
    }).whenComplete(() {
      log("User Data Set");
    }).catchError((error, stackTrace) {
      log("Error: $error");
    });
  }

  static Map<String, dynamic> toJSON(CurrentUser user) {
    return {
      'firstName': user.firstName,
      'lastName': user.lastName,
      'phoneNumber': user.phoneNumber,
      'email': user.email,
      'profilePicture': user.profilePicture,
      'lastUpdated': user.lastUpdated,
      'fav': user.fav,
      'cart': user.cart,
      'orders': user.orders,
    };
  }

  static loginUser(String email, String password) async {
    try {
      var userCred = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      log(userCred.toString());
      CurrentUser.currentUserUid = userCred.user!.uid;
      await FirestoreUserData.getProfileData(userCred.user!.uid);
      CurrentUser.getCurrentUser();
      return "all is well";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        return 'Wrong password provided for that user.';
      }
    } catch (_) {
      return "exception error";
    }
  }

  static Future<dynamic>? registerUser(CurrentUser user, String pass) async {
    try {
      var userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user.email, password: pass);
      userCred.user!.updateDisplayName(user.firstName + " " + user.lastName);
      log(userCred.toString());
      await FirestoreUserData.setData(user, userCred.user!.uid);
      return "all is well";
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return 'The password provided is too weak.';
      } else if (e.code == 'email-already-in-use') {
        return 'The account already exists for that email.';
      }
    } catch (_) {
      return "exception error";
    }
    return null;
  }
}

myUrlLauncher(String link) async {
  String url = link;
  final Uri _url = Uri.parse(url);

  await launchUrl(_url, mode: LaunchMode.externalApplication);
}
