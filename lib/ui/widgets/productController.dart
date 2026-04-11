import 'dart:convert';

import 'package:bazaarhub/ui/Utils/utils.dart';
import 'package:bazaarhub/ui/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController {
  List<Data> products = [];
  Future fatchProduct() async {
    final response = await http.get(
      Uri.parse(Urls.readProduct),
      headers: {'Accept': 'application/json'},
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      productModel model = productModel.fromJson(data);
      products = model.data ?? [];
    }
  }

  Future<bool> createProduct(
    String name,
    String img,
    int qty,
    int unitPrice,
    int totalprice,
  ) async {
    final response = await http.post(
      Uri.parse(Urls.createProduct),
      body: jsonEncode({
        "ProductName": name,
        "ProductCode": DateTime.now().microsecondsSinceEpoch,
        "Img": img,
        "Qty": qty,
        "UnitPrice": unitPrice,
        "TotalPrice": totalprice,
      }),
    );
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> DeleteProduct(String productId) async {
    final response = await http.get(Uri.parse(Urls.deleteProduct(productId)));
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
