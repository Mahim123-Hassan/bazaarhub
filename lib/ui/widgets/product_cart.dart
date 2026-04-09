import 'package:flutter/material.dart';
class productCard extends StatelessWidget {
  const productCard({
    super.key,
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
                height: 120,
                child: Image.network(
                    "https://wallpapercave.com/wp/wp4517399.jpg"
                ),
              ),
            ),
            Text("Cauliflower",style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
            Text("Price: \$05  | QRT: 200 ",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.black54),),
            Row(
              mainAxisAlignment: .spaceEvenly,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.edit,color: Colors.green,)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,)),
              ],
            )
          ],
        ),
      ),
    );
  }
}