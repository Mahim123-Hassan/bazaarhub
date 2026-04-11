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
  ProductController productController = ProductController();
  Future fetchData() async {
    await productController.fatchProduct();
    setState(() {});
  }

  productDialog({
    String? id,
    String? name,
    String? img,
    int? qty,
    int? unitPrice,
    int? totalPrice,
    required bool isupdate,
  }) {
    TextEditingController productNameController = TextEditingController();
    TextEditingController ProductIMGController = TextEditingController();
    TextEditingController ProductQTYController = TextEditingController();
    TextEditingController ProductUnitPriceController = TextEditingController();
    TextEditingController ProductTOtalPriceController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isupdate ? "Update Product" : "Add product"),
        content: Column(
          mainAxisSize: .min,
          children: [
            TextField(
              controller: productNameController,
              decoration: InputDecoration(labelText: "Product Name"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ProductIMGController,
              decoration: InputDecoration(labelText: "Product img"),
            ),

            SizedBox(height: 10),
            TextField(
              controller: ProductQTYController,
              decoration: InputDecoration(labelText: "Product qty"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ProductUnitPriceController,
              decoration: InputDecoration(labelText: "Product unitPrice"),
            ),
            SizedBox(height: 10),
            TextField(
              controller: ProductTOtalPriceController,
              decoration: InputDecoration(labelText: "Product Total price"),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("Cancel"),
                ),
                ElevatedButton(
                  onPressed: () async {
                   await productController.createProduct(
                      productNameController.text,
                      ProductIMGController.text,
                      int.parse(ProductQTYController.text),
                      int.parse(ProductQTYController.text),
                      int.parse(ProductTOtalPriceController.text),
                    );
                   setState(() {

                   });
                    Navigator.pop(context);
                  },
                  child: Text("Save"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

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
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          var product = productController.products[index];
          return productCard(
            product: product,
            onDelete: () {
              productController.DeleteProduct(product.sId.toString()).then((
                value,
              ) async {
                if (value) {
                  await productController.fatchProduct();

                  setState(() {
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Product Deleted")),
                      );
                    });
                  });
                } else {
                  setState(() {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Something Wrong ...!")),
                    );
                  });
                }
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        foregroundColor: Colors.white,
        backgroundColor: Colors.green,
        onPressed: () {
          productDialog(isupdate: false);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
