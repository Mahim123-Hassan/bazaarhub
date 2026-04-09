
import 'dart:convert';

import 'package:bazaarhub/ui/Utils/utils.dart';
import 'package:bazaarhub/ui/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductController {
  List<Data>products=[];
  Future fatchProduct()async{
    final response = await http.get(Uri.parse(Urls.readProduct),
      headers: {
      'Accept':'application/json'
      }
    );
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      final data=jsonDecode(response.body);
      productModel model =productModel.fromJson(data);
      products =model.data??[];
    }
  }
}