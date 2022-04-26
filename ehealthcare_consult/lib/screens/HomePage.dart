import 'package:ehealthcare_consult/Mainmenu/main_page.dart';
import 'package:ehealthcare_consult/Mainmenu/mainmenu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ehealthcare_consult/screens/st.dart';
import 'package:ehealthcare_consult/login/googlein.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User ?user;
  bool isloggedin = false;


  // ignore: non_constant_identifier_names
  checke_healthcare() async {
    _auth.authStateChanges().listen((user) {
      if (user == null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => St()));
      }
    }
    );
  }

  getUser() async {
    User firebaseUser = _auth.currentUser!;
    await firebaseUser.reload();
    firebaseUser = _auth.currentUser!;

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isloggedin = true;

      });


    }


  }

  signOut() async {
    _auth.signOut();

  }

  @override
  void initState() {
    super.initState();
    var initializationSettingsAndroid =
    AndroidInitializationSettings('doctor');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        android: initializationSettingsAndroid, iOS: initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings);
    this.checke_healthcare();
    this.getUser();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

    backgroundColor: const Color(0xffffffff),
        body: Container(

          child: !isloggedin ? Center(child: CircularProgressIndicator(),) :

          Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[

              // SizedBox(height: 40.0),

                  Container(
                    // height: 200,
                    child:
                      Image.asset(
                      "images/welcome.gif",fit: BoxFit.fill,),

                    ),

          Container(

            child: CircleAvatar(
              maxRadius: 30,
              backgroundImage: user?.photoURL!=null ? NetworkImage(user!.photoURL!)  : NetworkImage("https://www.clipartkey.com/mpngs/m/152-1520367_user-profile-default-image-png-clipart-png-download.png"),),
            ),


          Container(

            child: Text(
              "Hello ${user!.displayName}, you are Logged in as ${user!.email}",
              style: TextStyle(
                  fontFamily: 'SourceCodePro',
                  fontSize: 18,
                  fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),
          ),

          RaisedButton(

            padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
            onPressed: (){
              signOut();
              signOutGoogle();

            },
            child: Text('Signout', style: TextStyle(

                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold

            )),

            color: Colors.orange,
            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(20.0),
            ),
          ),

                RaisedButton(

                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => MainPageMenu()));
                     showBigPictureNotification();
                    },
                  child: Text('Proceed to main menu', style: TextStyle(

                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                  )
                  ),

                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),

              ],
          ),
        )
    );
  }
  Future<void> showBigPictureNotification() async {
    var scheduledNotificationDateTime =
       DateTime.now().add(Duration(seconds: 1));
    var bigPictureStyleInformation = BigPictureStyleInformation(
        DrawableResourceAndroidBitmap("notify"),
         largeIcon: DrawableResourceAndroidBitmap("doctor1"),
        contentTitle: 'Welcome to E-Healthcare.',
        htmlFormatContentTitle: true,
        summaryText: 'Dear ${user!.displayName}, Explore the E-Healthcare.',
        htmlFormatSummaryText: true);
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
        'id',
        'Welcome Notification',
        sound: RawResourceAndroidNotificationSound('juntos'),
        playSound: true,
        styleInformation: bigPictureStyleInformation);
    var platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics,);
    await flutterLocalNotificationsPlugin.schedule(
        1, 'Hello ${user!.displayName}, Welcome to E-Healthcare.', 'Healing hands and caring hearts.❤❤',scheduledNotificationDateTime, platformChannelSpecifics,
        payload: "big image notifications");
  }


  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
}
