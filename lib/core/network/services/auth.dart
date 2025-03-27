

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService{

  final FirebaseAuth _auth = FirebaseAuth.instance;

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

}