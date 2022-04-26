import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lottie/lottie.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.lightGreenAccent,
        title: Text('Contact Us'),
      ),
        body: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Lottie.asset('images/Contact.json',
                //   height: 250,
                )
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Have any query? \n Feel free to contact us.',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey[800],
              ),
            ),
          RaisedButton(
            color: Colors.lightGreenAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),

            onPressed: () async {
              await launch('mailto:swarajpatil60@gmail.com?subject=E-Healthcare.');
            },
            child: Text('Email'),
          ),
          RaisedButton(
            color: Colors.deepOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () async {
              await launch('tel:+918983303630');
            },
            child: Text('Phone'),
          ),
          RaisedButton(
            color: Colors.amberAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () async {
              await launch('sms:8983303630');
            },
            child: Text('SMS'),
          ),

        Text(' ©Swaraj Patil. ',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurpleAccent),
             ),
            // Text('All Rights Reserved.',
            //   style: TextStyle(
            //       fontSize: 20,
            //       color: Colors.orange),
            //   ),
    ],
    ),
    );
  }
}