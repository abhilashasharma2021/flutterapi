import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Friend extends StatelessWidget {
  const Friend(String friend, {Key? key,required this.listType}) : super(key: key);
  final String listType;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              listType,
              style: Theme.of(context).textTheme.displaySmall,
            ),
          ],
        ),
      ),
    );
  }
}
