import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StripePaymentGateway extends StatefulWidget {
  const StripePaymentGateway({Key? key}) : super(key: key);

  @override
  State<StripePaymentGateway> createState() => _StripePaymentGatewayState();
}

class _StripePaymentGatewayState extends State<StripePaymentGateway> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stripe Payment"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green
            ),
            child: Center(
              child: Text('Pay'),
            ),
          )
        ],
      ),
    );
  }
}
