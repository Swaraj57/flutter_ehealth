import 'package:ehealthcare_consult/Mainmenu/bloodbank.dart';
import 'package:ehealthcare_consult/Mainmenu/contact_us.dart';
import 'package:ehealthcare_consult/Mainmenu/doctor.dart';
import 'package:ehealthcare_consult/Mainmenu/emergency.dart';
import 'package:ehealthcare_consult/Mainmenu/gmap.dart';
import 'package:ehealthcare_consult/Mainmenu/medical.dart';
import 'package:ehealthcare_consult/Mainmenu/shop.dart';
import 'package:ehealthcare_consult/medicine_reminder/medicine-main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'medstore.dart';

class MainPageMenu extends StatefulWidget {
  @override
  _MainPageMenuState createState() => _MainPageMenuState();
}

class _MainPageMenuState extends State<MainPageMenu> {

  User? user = FirebaseAuth.instance.currentUser;

  List<String> imgUrl = <String>[


     "images/Hospital.png",
      "images/cart.png",
      "images/contact.png",
      "images/Blood.png",
      "images/Doctor.png",
      "images/emergency.png",
      "images/medical.png",
      "images/medical.png",
    "images/emergency.png",
      ];

  List<Color> colors = <Color>[Colors.blue,Colors.purple,Colors.blue,Colors.blue,Colors.blue,Colors.blue,Colors.blue,Colors.blue,Colors.blue];
  List<String> menuText = <String>["Hospital Locator", "Shop","Contact us","Blood Bank Locator",
    "Consult a Doctor","Emergency Numbers","web","Pharmacy near me","Medicine Reminder"];


  List<Widget> menus = <Widget>[Gmap(),Shop(),Contact(),Blood(),Doctor(),EmergencyNumbers(),WebViewExample(),
    Medical(),
   MyMedicineRemainder()];

  TextStyle textStyle = TextStyle(
    fontSize: 20,
  );

  // final String message = DateTime.now().hour < 12 ? "Good Morning.."  : "Good Afternoon..";

  String greetingMessage(){

    var timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return 'Good Morning..';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon..';
    } else {
      return 'Good Evening..';
    }
  }



  @override
  Widget build(BuildContext context) {
    String greetingMes = greetingMessage();
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("E-healthcare Consultant"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Hello ${user!.displayName}, \n$greetingMes",style: TextStyle(fontWeight:FontWeight.bold,fontFamily: 'Raleway', fontSize: 30),),
            ),
            ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: menus.length,
              itemBuilder: (context, index) => Card(
                color: colors[index],

              child: InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => menus[index],)),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal:12.0),
                  width: _width,
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(menuText[index],style: textStyle,),
                          Container(
                              height: 130,
                              child: Image.asset(imgUrl[index],fit: BoxFit.fitHeight,),)
                        ],
                      ),
            // ElevatedButton(onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder:(context) => menus[index], )), child: Text("Explore"))
                    ],

                  ),
            ),
              ),),),
          ],
        ),
      ),
    );
  }
}
