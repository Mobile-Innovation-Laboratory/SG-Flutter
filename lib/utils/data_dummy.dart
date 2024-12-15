import 'package:study_group_flutter/models/product_model.dart';

class DataDummy {
  static final List<String> listDummyCategories = [
    'All',
    'Watch',
    'Shirt',
    'Shoes',
    'Cosmetic',
    'Furniture',
  ];

  static final List<ProductModel> listDummyProducts = [
    ProductModel(
      id: '1',
      image: 'assets/images/img_watch.png',
      title: 'Mi Band 8 Pro',
      price: 54.00,
      description: 'test',
      isFavorite: true,
    ),
    ProductModel(
      id: '2',
      image: 'assets/images/img_shirt.png',
      title: 'Lycra Men\'s shirt',
      price: 12.00,
      description: 'test',
      isFavorite: false,
    ),
    ProductModel(
      id: '3',
      image: 'assets/images/img_headphone.png',
      title: 'Siberia 800',
      price: 45.00,
      description: 'test',
      isFavorite: false,
    ),
    ProductModel(
      id: '4',
      image: 'assets/images/img_shoes.png',
      title: 'Nike Air Jordan',
      price: 35.00,
      description: 'test',
      isFavorite: false,
    ),
  ];
}
