import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class AllCards extends StatefulWidget {
  const AllCards({Key? key}) : super(key: key);

  @override
  State<AllCards> createState() => _AllCardsState();
}

class _AllCardsState extends State<AllCards> {
  List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('List'),
        ),
         body: Card(
           color: Colors.orange,
           child: GridView.count(
            padding: EdgeInsets.fromLTRB(10, 15, 10, 0),
            crossAxisCount: 2,
            children: products
                .map((e) => Column(
              children: [
                SizedBox(
                    height: 120,
                    child: Image.network(e.image)),

                SizedBox(
                  height: 5,
                ),
                Text(e.name.toString())
              ],
            ))
                .toList(),
          ),
        ));
  }

  @override
  void initState() {
    initProductsList();
  }

  void initProductsList() {
    for (int i = 1; i < 21; i++) {
      products.add(Product(i, 'product ' + i.toString(),
          'https://truth-events.com/wp-content/uploads/2019/09/dummy.jpg'));
    }
  }
}
