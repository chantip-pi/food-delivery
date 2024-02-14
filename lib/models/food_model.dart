class Food {
  final int id;
  final String name;
  final int prepTime;
  final double price;
  final String image;
 

  Food({
    required this.id,
    required this.name,
    required this.prepTime,
    required this.price,
    required this.image,
  }) ;


 @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is Food && other.id == id;
}
