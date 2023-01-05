import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';

class CardImplement extends StatefulWidget {
  const CardImplement({Key? key}) : super(key: key);

  @override
  State<CardImplement> createState() => _CardImplementState();
}

class _CardImplementState extends State<CardImplement> {
  int _crossAxisCount=2;
  double _aspectRatio=1.3;
  List<Product> products = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey[900],
        title: const Text("Show Card List",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18.0,
        )),
      ),
      body: GridView.count(
        crossAxisCount: _crossAxisCount,
        childAspectRatio: _aspectRatio,
        children: List.generate(20, (index) {
          return Padding(

            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0), // shadow direction: bottom right
                  )

                ],

                image: DecorationImage(
                  image:AssetImage("assets/scratch.jpg"),
                  fit: BoxFit.fill,
                ),
                borderRadius:
                BorderRadius.all(Radius.circular(20.0),),
              ),
            ),
          );
        },)
            .toList(),



      ),
    );
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
/*  height: 120,
          width: 120,
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Theme.of(context).canvasColor,
              boxShadow: const[
                BoxShadow(
                    color: Colors.grey,
                    offset: Offset(0.0, 1.0),
                    blurRadius: 6.0),

              ]
          ),*/