import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Gmap extends StatefulWidget {

  _GmapState createState() => _GmapState();
}

class _GmapState extends State<Gmap> {
   Set<Marker> _markers = {};
BitmapDescriptor ?mapMarker;

@override
  void initState() {
    super.initState();
   setCustomMarker();
  }

   void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'images/map.png');
   }
   void _onMap(GoogleMapController controller) {
     setState(() {
       _markers.add(Marker(markerId: MarkerId('id-1'),
         position: LatLng(19.455116, 72.810179),
         icon: mapMarker!,
         infoWindow: InfoWindow(
           title: 'Sanjivani Hospital',
           snippet: 'Near station',
         )
       ),);
       _markers.add(Marker(markerId: MarkerId('id-2'),
       position: LatLng(19.459473, 72.813861),
           icon: mapMarker!,
           infoWindow: InfoWindow(
           title: 'Jivdani Hospital',
           snippet: 'Hospital',
         )
       ),);
       _markers.add(Marker(markerId: MarkerId('id-3'),
       position: LatLng(19.464938, 72.814677),
           icon: mapMarker!,
           infoWindow: InfoWindow(
           title: 'Paras Hospital',
           snippet: 'Hospital',
         )
       ),);
       _markers.add(Marker(markerId: MarkerId('id-4'),
       position: LatLng(19.436281, 72.811169),
           icon: mapMarker!,
           infoWindow: InfoWindow(
           title: 'Riddhi Vinayak Multispeciality Hospital',
           snippet: 'Hospital',
         )
       ),);
       _markers.add(Marker(markerId: MarkerId('id-5'),
       position: LatLng(19.446984, 72.804286),
           icon: mapMarker!,
           infoWindow: InfoWindow(
           title: 'Sahayog Hospital',
           snippet: 'Hospital',
         )
       ),);
       _markers.add(Marker(markerId: MarkerId('id-6'),
       position: LatLng(19.409401, 72.831409),
           icon: mapMarker!,
           infoWindow: InfoWindow(
           title: 'Vinayaka Hospital',
           snippet: 'Hospital',
         )
       ),);
       _markers.add(Marker(markerId: MarkerId('id-7'),
       position: LatLng(19.364322, 72.804721),
           icon: mapMarker!,
           infoWindow: InfoWindow(
           title: 'Cardinal Gracias Memorial Hospital',
           snippet: 'Hospital',
         )
       ),);
       _markers.add(Marker(markerId: MarkerId('id-8'),
       position: LatLng(19.368605, 72.817182),
           icon: mapMarker!,
           infoWindow: InfoWindow(
           title: 'Navjeevan Hospital',
           snippet: 'Hospital',
         )
       ),);
       _markers.add(Marker(markerId: MarkerId('id-9'),
       position: LatLng(19.405344, 72.849927),
           icon: mapMarker!,
           infoWindow: InfoWindow(
           title: 'Platinum Hospital',
           snippet: 'Hospital',
         )
       ),);
       _markers.add(Marker(markerId: MarkerId('id-10'),
       position: LatLng(19.415514, 72.808733),
           icon: mapMarker!,
           infoWindow: InfoWindow(
           title: 'Sterling Hospital & ICU',
           snippet: 'Hospital',
         )
       ),);
       _markers.add(Marker(markerId: MarkerId('id-11'),
       position: LatLng(19.439810, 72.823099),
           icon: mapMarker!,
           infoWindow: InfoWindow(
           title: 'Jagannath Hospital',
           snippet: 'Hospital',
         )
       ),);
     });
   }
       
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(

        onMapCreated: _onMap,
        markers: _markers,
        myLocationButtonEnabled: true,
        myLocationEnabled: true,
        zoomGesturesEnabled: true,
        zoomControlsEnabled: true,
        // trafficEnabled: true,
        // padding: EdgeInsets.only(top: 600),
        initialCameraPosition: CameraPosition(
        target: LatLng(19.456331 , 72.810211),
        zoom: 11,



      ),
      ),
    );
  }
}
