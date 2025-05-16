import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import '../models/product_model.dart';
import 'product_service_interface.dart';

class ProductService implements ProductServiceInterface {
  final String baseUrl;

  ProductService(this.baseUrl);

  @override
  Future<List<ProductModel>> getProducts() async {
    final response = await http.get(Uri.parse('$baseUrl/products'));

    if (response.statusCode == 200) {
      final List<dynamic> productsJson = jsonDecode(response.body);
      log(response.body);
      return productsJson.map((json) => ProductModel.fromJson(json)).toList();
    } else {
      log(response.body);
      throw Exception('API failed: ${response.statusCode}');
    }
  }

}
