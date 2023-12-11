class ItemModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;

  ItemModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });

  factory ItemModel.formMap({required Map data}) {
    return ItemModel(
      id: data['id'],
      price: data['price'],
      description: data['description'],
      category: data['category'],
      image: data['image'],
      title: data['title'],
    );
  }
}
