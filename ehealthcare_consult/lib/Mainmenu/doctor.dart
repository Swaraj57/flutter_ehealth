import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Doctor extends StatefulWidget {
  @override
  _DoctorState createState() => _DoctorState();
}


class _DoctorState extends State<Doctor> {


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: Text('Consult a Doctor'),
        backgroundColor: Colors.deepPurpleAccent,
      ),
      backgroundColor: Colors.lightBlue,

      body: SafeArea(
          child: Column(children: <Widget>[
            buildMenu(),
            FittedBox(
              fit: BoxFit.contain,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10.0,
                      bottom: 7.0,
                      right: 15.0,
                    ),
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      child: Text(
                        "Below is the list of doctors\navailable for your consultation.",
                        style: TextStyle(
                          fontSize: 21.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  Image.asset('images/stethoscope.png'),
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
                child: Dr_list(),
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

// ignore: camel_case_types
class Dr_list extends StatefulWidget {
  @override
  _Dr_listState createState() => _Dr_listState();
}

// ignore: camel_case_types
class _Dr_listState extends State<Dr_list> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          buildListTile(

            title: 'Dr. V.S.V. Prasad',
            number: '040 – 4040 4455',
            sub: 'Paediatrician, Pediatrician Cardiac at Lotus Children Hospitals in Kukatpally, Hyderabad.',
            email: 'lotushospitalsseo@gmail.com',

            image: NetworkImage( "http://www.doctorsdirectoryindia.com/uploads/profile/15832.jpg"),
          ),
          buildListTile(
            title: 'Dr. Shri Niwash Jangir',
            number: '+91 9812075333',
            sub: 'Psychiatrist in Jaipur.',
            email: 'drsnjangir@gmail.com',

            image: NetworkImage("http://www.doctorsdirectoryindia.com/uploads/profile/15857.jpg"),
          ),
          buildListTile(
            title: 'Dr. Swapnil Mate, MD DM',
            number: '+91 9529963828',
            sub: 'Cardiologist at Kamala Nehru Hospital, ONP Hospital & NM Wadia Hospital Pune.',
            email: 'drswapnilmate@gmail.com ',

            image: NetworkImage("http://www.doctorsdirectoryindia.com/uploads/profile/15866.jpg"),
          ),
          buildListTile(
            title: 'Dr. Priya Tiwari, MBBS',
            number: '+91 8377828241',
            sub: 'Senior Consultant Medical Oncologist in Artemis Hospital.',
            email: 'priyatiwaripost@gmail.com ',

            image: NetworkImage("http://www.doctorsdirectoryindia.com/uploads/profile/15915.jpg"),
          ),
          buildListTile(
            title: 'Dr. Shubhangi Lokhande Dole, MDS ',
            number: '+91 9307325967',
            sub: 'Experienced and skillful dentist with her keen interest in Dental Implants, Dentures, Microscopic Dentistry, Root Canal Treatments, Crown and Bridges etc.',
            email: 'odontovilledc@gmail.com ',

             image: NetworkImage("http://www.doctorsdirectoryindia.com/uploads/profile/15971.jpg"),
          ),
        ],
      ),
    );
  }


  Widget buildListTile({
    required String title,
    String? number,
    String? sub,
    String? email,
    ImageProvider? image,
  }) =>
      Card(
        child: Column(
          children: [
            Container(
              height: 80,
              child: ListTile(
                // onTap: () {
                //   dialCall('tel:$number');
                // },

                contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
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
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(icon: Icon(Icons.call),onPressed: (){
                  dialCall('tel:$number');
                },
                  iconSize: 30,),
                IconButton(icon: Icon(Icons.email_rounded),onPressed: () async {
                  await launch('mailto:$email');
                },
                  iconSize: 30,),
              ],
            )
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