

import 'package:car_rental_app/model/card_model/Card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService{

  final String? uid;
  DatabaseService({this.uid});

  // Collection Reference
  final CollectionReference cardCollection = FirebaseFirestore.instance.collection('Cards');
  final CollectionReference brandCollection = FirebaseFirestore.instance.collection('Brands');


  // Add brand to database
  Future<String> addBrand({required String brandName, required String image ,required String url, required String createdAt})async{
    try{
      // // Reference to the subcollection
      // DocumentReference userDocRef = cardCollection.doc(uid);
      await brandCollection.doc().set({
        "name": brandName,
        "image": image,
        "url": url,
        "createdAt": createdAt,
      });

      return '';
    }catch(e){
      return e.toString();
    }
  }

  
  // Add card to database
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

  // Card list from snapshot
  List<CardModel> _cardListFromSnapshot (QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      // Cast the result of doc.data() to a Map<String, dynamic>
      final data = doc.data() as Map<String, dynamic>;
      return  CardModel.fromMap(data);
    } ).toList();
  }

  // Get card details
  Stream<List<CardModel>> get cards{
    return cardCollection
      .doc(uid)
      .collection('cardLists')
      .snapshots()
      .map(_cardListFromSnapshot);
  }
}