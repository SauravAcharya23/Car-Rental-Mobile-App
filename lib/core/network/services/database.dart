

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  // Collection Reference
  final CollectionReference cardCollection = FirebaseFirestore.instance.collection('Cards');


  Future<String> addCards({required cardName, required cardNumber, required expiryDate, required cvv}) async {

    try{
      // Reference to the subcollection
      DocumentReference userDocRef = cardCollection.doc(uid);
      CollectionReference subCollectionRef = userDocRef.collection('cardLists');

      // Check if card already exists
      QuerySnapshot querySnapshot = await subCollectionRef.where('cardNumber', isEqualTo: cardNumber).get();

      if(querySnapshot.docs.isEmpty){
        // Add a new document to the subcollection
        await subCollectionRef.add({
          'cardName':cardName,
          'cardNumber': cardNumber,
          'expiryDate': expiryDate,
          'cvv':cvv
        });

        return "1";
      }else{
        return "2";
      }
      
    }catch(e){
      return e.toString();
    }
  }
}