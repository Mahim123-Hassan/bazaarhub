import 'package:bazaarhub/ui/model/product_model.dart';
import 'package:flutter/material.dart';

class productCard extends StatelessWidget {
  final Data product;
  final VoidCallback onDelete;
  // final VoidCallback onEdete;

  const productCard({
    super.key,
    required this.product,
    required this.onDelete,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Container(
                height: 127,
                child: Image.network(
                  (product.img != null &&
                          product.img.toString().startsWith('http'))
                      ? product.img.toString()
                      : 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXHnoMuEe26njm1NGGqc7rJreExwijRgb5aw&s',
                ),
              ),
            ),
            Text(
              product.productName.toString(),
              style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
            ),
            Text(
              "Price: \$${product.unitPrice} | QRT: ${product.qty} ",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.edit, color: Colors.green),
                ),
                IconButton(
                  onPressed: () {
                    onDelete();
                  },
                  icon: Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
