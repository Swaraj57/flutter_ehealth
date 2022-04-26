import 'package:ehealthcare_consult/Mainmenu/bloodbank.dart';
import 'package:ehealthcare_consult/Mainmenu/doctor.dart';
import 'package:ehealthcare_consult/Mainmenu/emergency.dart';
import 'package:ehealthcare_consult/Mainmenu/medical.dart';
import 'package:ehealthcare_consult/Mainmenu/gmap.dart';
import 'package:ehealthcare_consult/Mainmenu/shop.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ehealthcare_consult/Mainmenu/faq.dart';
import 'package:ehealthcare_consult/Mainmenu/contact_us.dart';

class Mainmenu extends StatefulWidget {
  @override
  _MainmenuState createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {

  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text('E-Healthcare Consult'),
          backgroundColor: Colors.lightBlueAccent,
        ),
            body: GridView.count(
              padding: EdgeInsets.only(top: 10),
              crossAxisCount: 1,
              children: <Widget>[
                Card(

                  elevation: 5,
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.blue[500],
                  child: new InkWell(

                    // onTap: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Gmap()));
                    // },
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Center(
                              child: Image(image: AssetImage('images/Hospital.png'),
                              height: 95,
                              width: 95,
                                ),
                            ),
                            Container(

                              margin: EdgeInsets.only(top: 120,right: 10,left:10),
                              child: Text('Hospital\nLocator',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Card(

                    elevation: 5,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    color: Colors.red,
                    child: new InkWell(

                      // onTap: (){
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>EmergencyNumbers()));
                      //   },
                      child: FittedBox(
                        fit: BoxFit.contain,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: <Widget>[
                            Center(
                              child: Image(image: AssetImage('images/emergency.png'),
                                height: 70,
                                width: 70,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 140,left:10,bottom: 15),
                              child: Text('Emergency',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.green[600],
                  child: new InkWell(
                    // onTap: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Medical()));
                    // },
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Center(
                          child: Image(image: AssetImage('images/medical.png'),
                            height: 80,
                            width: 80,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 135,left:10),
                          child: Text('Pharmacy \n Near Me',style: TextStyle(color: Colors.white,fontSize: 21.0,fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.indigoAccent,
                  child: new InkWell(
                    // onTap: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Shop()));
                    // },

                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Center(
                          child: Image(image: AssetImage('images/cart.png'),
                            height: 85,
                            width: 85,
                        ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 120,bottom:5,left:10),
                          child: Text('Shop',style: TextStyle(color: Colors.white,fontSize: 20.0,fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.amber[500],
                  child: new InkWell(
                    // onTap: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Blood()));
                    // },
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Center(
                          child: Image(image: AssetImage('images/Blood.png'),
                          height: 75,
                          width: 75,
                        ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 130,left:10),
                          child: Text('Blood Bank \n    Locator',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.orange,
                  child: new InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Faq()));
                    },
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Center(
                          child: Icon(Icons.question_answer_outlined,size: 70,color: Colors.white,),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 140,bottom:5,left:5),
                          child: Text('FAQ',style: TextStyle(color: Colors.white,fontSize: 21.0,fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.deepPurple[700],
                  child: new InkWell(
                    // onTap: (){
                    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Doctor()));
                    // },
                  child: FittedBox(
                    fit: BoxFit.contain,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: <Widget>[
                        Center(
                          child: Image(image: AssetImage('images/Doctor.png'),
                            height: 95,
                            width: 95,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 150,left:5),
                          child: Text('Consult a\n   Doctor',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                ),
                ),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  color: Colors.cyan[600],
                  child: new InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Contact()));
                    },
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Center(
                            child: Image(image: AssetImage('images/contact.png'),
                            height: 95,
                            width: 95,
                          ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 150,bottom:5,left:5),
                            child: Text('Contact us',style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
         );
      }
   }



