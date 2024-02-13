class Food {
  final String name;
  final int prepTime;
  final double price;
  final String image;
  int quantity = 0;

  Food({
    required this.name,
    required this.prepTime,
    required this.price,
    required this.image,
  });
}
