// lib/home.dart

import 'package:flutter/material.dart';

import 'model/product.dart'; // <--- AGREGA ESTA LÍNEA
import 'model/products_repository.dart';
import 'supplemental/asymmetric_view.dart';

class HomePage extends StatelessWidget {
  final Category category;

  const HomePage({this.category = Category.all, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Pass Category variable to AsymmetricView (104)
    return AsymmetricView(products: ProductsRepository.loadProducts(category));
  }
}
