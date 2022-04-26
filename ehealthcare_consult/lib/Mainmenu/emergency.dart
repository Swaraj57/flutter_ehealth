import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmergencyNumbers extends StatefulWidget {
  @override
  _EmergencyNumbersState createState() => _EmergencyNumbersState();
}


class _EmergencyNumbersState extends State<EmergencyNumbers> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: Text('Emergency'),
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      backgroundColor: Colors.red,

      body: SafeArea(
          child: Column(
              children: <Widget>[
            buildMenu(),
            FittedBox(
              fit: BoxFit.contain,
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8, bottom: 7, right: 18,),
                    child: Text(
                      "Emergency Helplines:",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Image.asset('images/emergency.png'),

                ],
              ),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Container(
                // width: 400,
                // height: 493,
                width: size.width,
                height: size.height * .560,
                child: Emergency(),
              ),
            ),
          ])),
    );
  }

  buildMenu() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: MaterialButton(
            onPressed: () {},
            height: 50.0,
            minWidth: 50.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
            ),
          ),
        ),
      ],
    );
  }
}

class Emergency extends StatefulWidget {
  @override
  _EmergencyState createState() => _EmergencyState();
}

class _EmergencyState extends State<Emergency> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildListTile(

            title: 'Vijayalaxmi Ambulance Service.',
            number: '+91 7947175320',
            sub: 'Nalasopara East.',

            image: AssetImage('images/ambulance.png'),


          ),
          buildListTile(
            title: 'A.K Ambulance Service.',
            number: '+91 7947181202',
            sub: 'L.M Road, Borivali West.',

            image: AssetImage('images/ambulance.png'),
          ),
          buildListTile(
            title: 'Pushpak Cardiac Ambulance Service.',
            number: '+91 7947175403',
            sub: 'Old Viva College Road, Virar West.',

            image: AssetImage('images/ambulance.png'),
          ),
          buildListTile(
            title: 'Shree Sai Ambulance Service.',
            number: '+91 8007048064',
            sub: 'Virar East.',

            image: AssetImage('images/ambulance.png'),
          ),
          buildListTile(
            title: 'N.H Cardiac Ambulance Service.',
            number: '+91 7947193017',
            sub: 'Vasai Phata - Vasai East.',

            image: AssetImage('images/ambulance.png'),
          ),
          buildListTile(
            title: 'Apollo Hospitals Emergency Care.',
            number: '1066',
            sub: 'CBD Belapur, Navi Mumbai.',

            image: AssetImage('images/ambulance.png'),
          ),
          buildListTile(
            title: 'SevenHills Emergency Health Services.',
            number: '+91 2267676766',
            sub: 'Marol Maroshi Road, Andheri East.',

            image: AssetImage('images/ambulance.png'),
          ),
          buildListTile(
            title: 'Gokul Park Charitable Trust.',
            number: '0250-2337076',
            sub: 'Manav Mandir, Diwanman.',

            image: AssetImage('images/ambulance.png'),
          ),
          buildListTile(
            title: 'Saddicha Seva Mandal.',
            number: '+91 9322041169',
            sub: 'Navghar West.',

            image: AssetImage('images/ambulance.png'),
          )
        ],
      ),
    );
  }


  Widget buildListTile({
    required String title,
    String ?number,
    String ?sub,
    ImageProvider?image,
  }) =>
      Card(
        child: Column(
          children: [
            Container(
              height: 130,
              child: ListTile(
                // onTap: () {
                //   dialCall('tel:$number');
                // },

                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                leading: CircleAvatar(
                   backgroundColor: Colors.red,
                  backgroundImage: image,
                  foregroundColor: Colors.white,
                  radius: 30,
                  child: image == null
                      ? Text(
                    title[0].toUpperCase(),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  )
                      : Container(height: 0, width: 0),
                ),
                title: Text(
                  title,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Text(sub!),
              trailing: IconButton(icon: Icon(
                  Icons.call,color: Colors.black87,),
              onPressed: (){
                dialCall('tel:$number');
              },
                iconSize: 30,
              ),
              ),
            ),
          ],
        ),
      );
}

void dialCall(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'call not possible $url';
  }
}