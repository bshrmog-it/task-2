class ItemModel {
  final String id;
  final String name;
  final String quantity;
  bool isBought;
  ItemModel({
    required this.name,
    required this.quantity,
    required this.id,
    this.isBought = false,
  });
}
