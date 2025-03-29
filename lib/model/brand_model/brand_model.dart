class BrandModel {
  final String createdAt;
  final String image;
  final String name;
  final String url;

  BrandModel({
    required this.createdAt,
    required this.image,
    required this.name,
    required this.url
  });

  // Convert Firestore Map to FavouriteModel
  factory BrandModel.fromMap(Map<String, dynamic> data) {
    return BrandModel(
      createdAt: data['createdAt'] ?? '',
      image: data['image'] ?? '',
      name: data['name'] ?? '',
      url: data['url'] ?? ''
    );
  }
}