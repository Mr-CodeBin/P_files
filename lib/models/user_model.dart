import 'dart:developer';

import 'package:engage_files/models/firestore_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

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
    Map<String, dynamic> data = await FirestoreUserData.getProfileData(uid);
    List<dynamic> fav = await FirestoreUserData.getFavorites(uid);
    List<dynamic> cart = await FirestoreUserData.getMyCart(uid);
    List<dynamic> orders = await FirestoreUserData.getOrders(uid);
    data['lastUpdated'] = DateTime.parse(data['lastUpdated']);
    data['phoneNumber'] = int.parse(data['phoneNumber'] ?? "0");
    data['fav'] = fav;
    data['cart'] = cart;
    data['orders'] = orders;
    log(data.toString());
    currentUser = CurrentUser.fromJSON(data);
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
      await FirestoreUserData.getProfileData(userCred.user!.uid);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        log('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        log('Wrong password provided for that user.');
      }
    } catch (_) {
      log("exception error");
    }
  }

  static Future<dynamic>? registerUser(CurrentUser user, String pass) async {
    try {
      var userCred = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: user.email, password: pass);
      userCred.user!.updateDisplayName(user.firstName + " " + user.lastName);
      log(userCred.toString());
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
