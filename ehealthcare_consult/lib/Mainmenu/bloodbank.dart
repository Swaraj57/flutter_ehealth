import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Blood extends StatefulWidget {

  _BloodState createState() => _BloodState();
}

class _BloodState extends State<Blood> {
  Set<Marker> _markers = {};
  BitmapDescriptor? mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'images/bloodbank.png');
  }
  void _onMap(GoogleMapController controller) {
    setState(() {
      _markers.add(Marker(markerId: MarkerId('id-1'),
          position: LatLng(19.455188,72.810312),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Swami Vivekanand Medical Mission’s Sanjivani Blood Bank.',
            snippet: 'स्वामी विवेकानंद मेडिकल मिशन’एस संजीवनी ब्लड बँक',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-2'),
          position: LatLng(19.419438,72.816563),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Sathiya Trust Blood Bank.',
            snippet: 'साथिया ट्रस्ट ब्लड बँक',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-3'),
          position: LatLng(19.358688,72.811813),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Vijayee Blood Bank.',
            snippet: 'विजयी ब्लड बँक ',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-4'),
          position: LatLng(19.381062,72.831312),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Sarla Blood Bank.',
            snippet: 'सरला ब्लड बँक',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-5'),
          position: LatLng(19.422438,72.822937),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Rajsukha Blood Bank.',
            snippet: 'राजसुख ब्लड बँक',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-6'),
          position: LatLng(19.274188,72.861187),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Rajiv Gandhi Blood Bank.',
            snippet: 'राजीव गांधी रक्तपेढी',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-7'),
          position: LatLng(19.135188,72.848062),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Manas Blood Bank.',
            snippet: 'मानस रक्तपेढी',
          )
      ),
      );
    }
    );
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
