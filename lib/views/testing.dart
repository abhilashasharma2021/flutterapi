import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapi/views/login_project.dart';

class Testing extends StatefulWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  void initState() {
    super.initState();
    /*Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                LoginProject()
            )
        )
    );*/
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      width: 200,
      child: Column(
        children: <Widget>[
          Text('One', textAlign: TextAlign.left),
          Text('Two', textAlign: TextAlign.right),
        ],
      ),
    );
  }
}
