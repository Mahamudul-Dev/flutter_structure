import 'package:flutter_structure/models/product_model.dart';
import 'package:flutter_structure/network/products_network.dart';

class ProductsRepository {
  final network = ProductsNetwork();


  final List<ProductModel> products = [];


  Future<List<ProductModel>> getProducts() async {
    final result = await network.requestProducts();


    for (var product in result) {
      products.add(ProductModel.fromJson(product));
    }
    

    return products;
  }
}