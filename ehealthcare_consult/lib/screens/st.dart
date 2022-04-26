import 'package:ehealthcare_consult/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:ehealthcare_consult/login/Login.dart';
import 'package:ehealthcare_consult/login/SignUp.dart';
import 'package:ehealthcare_consult/login/googlein.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
class St extends StatefulWidget {
  @override
  _StState createState() => _StState();
}

class _StState extends State<St> {

  navigateToLogin() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

  navigateToRegister() async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
  }

  Future<bool> _onbackpressed() async{
     final showpop = await showDialog(
        context: context,
        builder: (context)=>AlertDialog(
            title: Text("Are you sure you wanna exit..?"),
            actions: <Widget>[
              ElevatedButton(
                onPressed: ()=>Navigator.pop(context,false),
                child: Text("No"),

              ),
              ElevatedButton(
                onPressed: ()=>Navigator.pop(context,true),
                child: Text("Yes"),
              ),
            ]
        )
    );
return showpop ?? false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onbackpressed,

      child: SafeArea(
        child: Scaffold(

          body: Container(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[



                Container(
                  width: MediaQuery.of(context).size.width,
                  // height: 400,

                  child: Image(image: AssetImage("images/start.jpg"),
                    fit: BoxFit.contain,
                  ),
                ),



                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: RichText(
                      text: TextSpan(
                          text: 'Welcome to ', style: TextStyle(
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black
                      ),

                          children: <TextSpan>[
                            TextSpan(
                                text: 'E-Healthcare Consultant', style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.orange)
                            )
                          ]
                      )
                  ),
                ),


                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: FittedBox(

                    fit: BoxFit.fitWidth,
                    child: Text('A one-stop destination for all your health needs. ',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Raleway',
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),



                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[

                      RaisedButton(
                          padding: EdgeInsets.only(left: 30, right: 30),

                          onPressed: navigateToLogin,
                          child: Text('LOGIN', style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.purpleAccent
                      ),



                      RaisedButton(
                          padding: EdgeInsets.only(left: 30, right: 30),

                          onPressed: navigateToRegister,
                          child: Text('REGISTER', style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),),

                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          color: Colors.lightBlueAccent
                      ),

                    ],
                  ),
                ),

                Container(

                  child: SignInButton(

                    Buttons.Google,
                    text: "Sign in with Google",
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    onPressed:
                        () {
                      signInWithGoogle().then((result) {
                        if (result != null) {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                              builder: (context) {
                                return HomePage();
                              },
                            ),
                          );
                        }
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                  ),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.orange.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 40,
                          offset: Offset(0, 3),
                        ),
                      ]
                  ),
                ),
                Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
// crossAxisAlignment: CrossAxisAlignment.start,
                  // padding: EdgeInsetsDirectional.only(top:10),
                  // child: Text(
                  //   "Made with ❤ in Virar.", style: TextStyle(
                  //   fontFamily: 'Raleway',
                  //   // fontStyle:  ,
                  //   fontSize: 20,
                  //   fontWeight: FontWeight.bold,
                  // ),
                  // ),

                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    // const SizedBox(width: 1.0, height: 1.0),
                    // Container(
                    // // color: Colors.green,
                    //   height: 30,
                    //   width:220,
                    //   margin: EdgeInsets.only(top: 3),
                    //   child: const Text(
                    //     'Made  with  ❤  in Virar',
                    //     style: TextStyle(
                    //         fontFamily: 'Raleway',
                    //         fontSize: 20.0),
                    //   ),
                    // ),

                    // Container(
                    //   width: 80,
                    //   height: 30,
                    //   // color: Colors.blue,
                    //
                    //   child: DefaultTextStyle(
                    //     textAlign: TextAlign.start,
                    //     style: const TextStyle(
                    //
                    //       fontSize: 20.0,
                    //       fontFamily: 'Raleway',
                    //       color: Colors.black,
                    //     ),
                    //     child: AnimatedTextKit(
                    //
                    //       animatedTexts: [
                    //         RotateAnimatedText('Virar.'),
                    //         RotateAnimatedText('Vasai.'),
                    //         RotateAnimatedText(' Borivali.'),
                    //       ],
                    //       isRepeatingAnimation: true,
                    //       repeatForever: true,
                    //     ),
                    //   ),
                    // ),
                  ],

                ),
                // Container(
                //   child: Image(image: AssetImage("images/logo png.png"), width: 80,),
                // ),
                Container(

                  child: Text(
                    "V1.0.0",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






