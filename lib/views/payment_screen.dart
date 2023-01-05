// main.dart


/*
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // set the publishable key for Stripe - this is mandatory
  Stripe.publishableKey = stripePublishableKey;
  runApp(PaymentScreen());
}

// payment_screen.dart
class PaymentScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CardField(
            onCardChanged: (card) {
              print(card);
            },
          ),
          TextButton(
            onPressed: () async {
              // create payment method
              final paymentMethod =
              await Stripe.instance.createPaymentMethod(PaymentMethodParams.card());
            },
            child: Text('pay'),
          )
        ],
      ),
    );
  }
}*/
