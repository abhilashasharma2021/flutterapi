import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class Card extends StatefulWidget {
  const Card({Key? key}) : super(key: key);

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> {

  int _crossAxisCount=2;
  double _aspectRatio=1.5;
  List<Product> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Show List"),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Theme.of(context).canvasColor,
          boxShadow: const[
            BoxShadow(
                color: Colors.grey,
            offset: Offset(0.0, 1.0),
            blurRadius: 6.0),

          ]
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          child: GridView.count(
              crossAxisCount: _crossAxisCount,
          childAspectRatio: _aspectRatio,
            children: products
                .map((e) => Column(
              children: [
                SizedBox(
                    height: 120,
                    child: Image.network(e.image)),
                Text(e.name.toString())
              ],
            ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
