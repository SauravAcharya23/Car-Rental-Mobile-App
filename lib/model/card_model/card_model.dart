class CardModel {
  final String cardName;
  final String cardNumber;
  final String expiryDate;
  final String cvv;

  CardModel({
    required this.cardName,
    required this.cardNumber,
    required this.expiryDate,
    required this.cvv
  });

  // Convert Firestore Map to FavouriteModel
  factory CardModel.fromMap(Map<String, dynamic> data) {
    return CardModel(
      cardName: data['cardName'] ?? '',
      cardNumber: data['cardNumber'] ?? '',
      expiryDate: data['expiryDate'] ?? '',
      cvv: data['cvv'] ?? ''
    );
  }
}