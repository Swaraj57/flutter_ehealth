import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}



class _CheckoutState extends State<Checkout> {


  final FirebaseAuth auth = FirebaseAuth.instance;

   inputData() {
    final User? user = auth.currentUser;
    String uid = user!.displayName!;
    return uid;
  }

  generateRandomNumber()  {
    var randomGenerator = Random();
    int number= randomGenerator.nextInt(900000)+100000;
    return number;
  }

  Widget build(BuildContext context) {

     String username=inputData().toString();
     String num=generateRandomNumber().toString();

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Container(
              child:
                Lottie.asset('images/order.json'),
            ),
            Container(
              child: Text('Dear $username, Thank you for placing an order with us. Kindly note the order id for further reference.'
                  '\n \n Your order id is: $num',
                 style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'SourceCodePro',fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Text('\nNote: Due to the ongoing Covid-19 crisis, expect a short delay in delivering your order.',
                style: TextStyle(fontWeight: FontWeight.bold,fontFamily: 'Raleway'),
                textAlign: TextAlign.center,),
            ),
          ],
        ),
      ),
    );
  }
}
