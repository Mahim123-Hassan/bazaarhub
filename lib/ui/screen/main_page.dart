import 'package:bazaarhub/ui/model/product_model.dart';
import 'package:bazaarhub/ui/screen/main_page.dart';
import 'package:bazaarhub/ui/widgets/productController.dart';
import 'package:bazaarhub/ui/widgets/product_cart.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {

  const MainPage({super.key});

  static const String name = "/ MainPage";

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  ProductController productController =ProductController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productController.fatchProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BazaarHub",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
        backgroundColor: Colors.green.shade600,
        centerTitle: true,
      ),
      body: GridView.builder(
        itemCount: productController.products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7, crossAxisSpacing:10,
        ),
        itemBuilder: (context, index) {
          var product=productController.products[index];
          return productCard(product:product);
        },
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        onPressed: (){},child: Icon(Icons.add),),
    );
  }
}

