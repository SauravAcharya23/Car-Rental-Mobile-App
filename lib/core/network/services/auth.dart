

import 'package:car_rental_app/model/user/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // auth change user stream
  Stream<UserModel?> get user{
    // return _auth.authStateChanges().map(_userFromFirebaseUser);
    return _auth.authStateChanges().map((user) {
      return user != null ? UserModel(uid: user.uid, ) : null;
    });
  }

  // Register with Email & Password
  Future registerAccount({required String email, required String password, required String username})async{

    // Step 1: Create user with email and password
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email , password: password);

    // Step 3: Store user details manually in Firestore

    await FirebaseFirestore.instance.collection("Users").doc(userCredential.user!.uid).set({
      "name":username,
      "email": userCredential.user!.email,
    });

    User? user = userCredential.user;

    return user?.uid;

  }


  // Login with Email & Password
  Future loginAccount({required String email, required String password}) async{

    // Step 1: Login user with email and password
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);

    User? user = userCredential.user;

    return _userFromFirebaseUser(user);


  }

  // create user obj based on firebase user
  UserModel? _userFromFirebaseUser(User? user){
    return user == null ? null : UserModel(uid: user.uid,);
    // return UserModel(uid: user.uid);
  }


  // Logout user
  Future logout()async{
    await _auth.signOut();
  }

}