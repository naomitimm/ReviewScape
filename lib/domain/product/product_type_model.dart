import 'package:equatable/equatable.dart';
import 'package:ethio_agri_ceft_app/domain/product/product_model.dart';

class ProductType extends Equatable {
  final String productTypeName;
  final String imageUrl;
  final List<Product> products;

  const ProductType(
      {required this.imageUrl,
      required this.productTypeName,
      required this.products});
  @override
  List<Object?> get props => [productTypeName, imageUrl];
  static List<ProductType> productTypes = [
    const ProductType(
        productTypeName: 'Tea',
        imageUrl: 'assets/icons/tea.png',
        products: [
          Product(
              productName: 'Black Tea',
              imageUrl: 'assets/products/tea/black_tea.jpg',
              price: 186,
              ingridients: "",
              description: "",
              rating: 3.2),
          Product(
              productName: 'Green tea',
              imageUrl: 'assets/products/tea/green_tea.jpeg',
              price: 204,
              ingridients: "",
              description: "",
              rating: 4.0),
          Product(
              productName: 'Hibiscus Tea',
              imageUrl: 'assets/products/tea/hibiscus_tea.avif',
              price: 89,
              ingridients: "",
              description: "",
              rating: 2.0),
          Product(
              productName: 'Moringa Tea',
              imageUrl: 'assets/products/tea/moringa_tea.png',
              price: 116,
              ingridients: "",
              description: "",
              rating: 3.5),
          Product(
              productName: 'Oolong Tea',
              imageUrl: 'assets/products/tea/oolong_tea.jpg',
              price: 145,
              ingridients: "",
              description: "",
              rating: 4.8),
          Product(
              productName: 'Rooibos Tea',
              imageUrl: 'assets/products/tea/rooibos_tea.jpg',
              price: 199,
              ingridients: "",
              description: "",
              rating: 2.9),
        ]),
    const ProductType(
      productTypeName: 'Flowers',
      imageUrl: 'assets/icons/flowers.png',
      products: [
        Product(
            productName: 'Hyacinth Flower',
            imageUrl: 'assets/products/flower/hyyacinth_flowers.jpg',
            price: 134,
            ingridients: "",
            description: "",
            rating: 4.1),
        Product(
            productName: 'Dahlia Flower',
            imageUrl: 'assets/products/flower/orange_flower.jpg',
            price: 177,
            ingridients: "",
            description: "",
            rating: 3.2),
        Product(
            productName: 'Cone Flower',
            imageUrl: 'assets/products/flower/pink_flower.jpg',
            price: 122,
            ingridients: "",
            description: "",
            rating: 4.8),
        Product(
            productName: 'Tulip',
            imageUrl: 'assets/products/flower/tulip.jpg',
            price: 200,
            ingridients: "",
            description: "",
            rating: 3.8),
        Product(
            productName: 'White Roses',
            imageUrl: 'assets/products/flower/white_flower.jpg',
            price: 174,
            ingridients: "",
            description: "",
            rating: 4.2),
        Product(
            productName: 'Wild Flowers',
            imageUrl: 'assets/products/flower/wild_flower.jpg',
            price: 149,
            ingridients: "",
            description: "",
            rating: 3.0),
      ],
    ),
    const ProductType(
      productTypeName: 'Honey',
      imageUrl: 'assets/icons/honey.png',
      products: [
        Product(
            productName: 'Buckwheat Honey',
            imageUrl: 'assets/products/honey/buckwheat_honey.jpg',
            price: 279,
            ingridients: "",
            description: "",
            rating: 4.5),
        Product(
            productName: 'Clover Honey',
            imageUrl: 'assets/products/honey/clover_honey.jpg',
            price: 312,
            ingridients: "",
            description: "",
            rating: 4.8),
        Product(
            productName: 'Orange Honey',
            imageUrl: 'assets/products/honey/orange_honey.jpg',
            price: 209,
            ingridients: "",
            description: "",
            rating: 4.0),
        Product(
            productName: 'Wild Honey',
            imageUrl: 'assets/products/honey/wildflower_honey.jpg',
            price: 255,
            ingridients: "",
            description: "",
            rating: 3.5),
      ],
    ),
    const ProductType(
      productTypeName: 'Coffee',
      imageUrl: 'assets/icons/coffee.png',
      products: [
        Product(
            productName: 'Arabica Coffee',
            imageUrl: 'assets/products/coffee/arabica_coffee.jpg',
            price: 366,
            ingridients: "",
            description: "",
            rating: 4.6),
        Product(
            productName: 'Excelsa Coffee',
            imageUrl: 'assets/products/coffee/excelsa_coffee.avif',
            price: 299.9,
            ingridients: "",
            description: "",
            rating: 4.2),
        Product(
            productName: 'Liberinca Coffee',
            imageUrl: 'assets/products/coffee/liberinca_coffee.jpg',
            price: 322,
            ingridients: "",
            description: "",
            rating: 4.5),
        Product(
            productName: 'Robusta Coffee',
            imageUrl: 'assets/products/coffee/robusta_coffee.jpeg',
            price: 387,
            ingridients: "",
            description: "",
            rating: 3.9),
      ],
    ),
    const ProductType(
      productTypeName: 'Crops',
      imageUrl: 'assets/icons/food_crops.png',
      products: [
        Product(
            productName: 'Barley',
            imageUrl: 'assets/products/crops/barley.jpeg',
            price: 179.5,
            ingridients: "",
            description: "",
            rating: 4.2),
        Product(
            productName: 'ChickPea',
            imageUrl: 'assets/products/crops/chickpea.jpeg',
            price: 258,
            ingridients: "",
            description: "",
            rating: 3.8),
        Product(
            productName: 'Corn',
            imageUrl: 'assets/products/crops/corn.jpeg',
            price: 232,
            ingridients: "",
            description: "",
            rating: 4.6),
        Product(
            productName: 'Oatmeal',
            imageUrl: 'assets/products/crops/oats.webp',
            price: 304,
            ingridients: "",
            description: "",
            rating: 3.5),
        Product(
            productName: 'Soybean',
            imageUrl: 'assets/products/crops/soybean.webp',
            price: 319.6,
            ingridients: "",
            description: "",
            rating: 3.3),
        Product(
            productName: 'Wheat',
            imageUrl: 'assets/products/crops/wheat.jpeg',
            price: 389,
            ingridients: "",
            description: "",
            rating: 4.7),
      ],
    ),
  ];
}
