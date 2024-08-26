class Item {
  final String image;
  final String name;
  final String description;
  final double price;
  final int time;
  final double discount;

  Item({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.time,
    required this.discount,
  });

  // Factory constructor to create an Item from a Map
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      image: map['image'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      time: map['time'] ?? 0,
      discount: (map['discount'] ?? 0).toDouble(),
    );
  }

  // Method to convert an Item to a Map
  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'description': description,
      'price': price,
      'time': time,
      'discount': discount,
    };
  }
}
