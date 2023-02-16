import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String productName;
  final String imageUrl;
  final double? price;
  final String ingridients;
  final String description;
  final double rating;
  const Product(
      {required this.productName,
      required this.imageUrl,
      required this.price,
      required this.description,
      required this.ingridients,
      required this.rating});

  static List<Product> popularProducts = [
    const Product(
        productName: 'Blended Tea',
        imageUrl: 'assets/pics/tea.jpeg',
        price: 200.99,
        ingridients: "",
        description: "",
        rating: 4.8),
    const Product(
        productName: 'Red Roses',
        imageUrl: 'assets/pics/flowers.jpg',
        price: 344,
        ingridients: "",
        description: "",
        rating: 4.7),
    const Product(
        productName: 'Regular Honey',
        imageUrl: 'assets/pics/honey.jpg',
        price: 372,
        ingridients: "",
        description: "",
        rating: 4.9),
    const Product(
        productName: 'Dark Roast Coffee',
        imageUrl: 'assets/pics/coffee.jpg',
        price: 289,
        ingridients: "",
        description: "",
        rating: 4.3),
    const Product(
        productName: 'Chickpea',
        imageUrl: 'assets/pics/crop1.jpg',
        price: 134,
        ingridients: "",
        description: "",
        rating: 3.8),
    const Product(
        productName: 'Sweet Corn',
        imageUrl: 'assets/pics/crop2.jpg',
        price: 130,
        ingridients: "",
        description: "",
        rating: 3.5),
  ];

  @override
  List<Object?> get props => [productName, imageUrl, price];
}
