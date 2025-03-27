

class FirestoreUserModel{

  final String name;
  final String email;

  FirestoreUserModel({
    required this.name,
    required this.email,
  });

  factory FirestoreUserModel.fromMap(Map<String, dynamic> data){
    return FirestoreUserModel(
      name: data['name'] ?? '',
      email: data['email'] ?? '',
    );
  }
}