import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Medical extends StatefulWidget {
  @override
  _MedicalState createState() => _MedicalState();
}

class _MedicalState extends State<Medical> {
  Set<Marker> _markers = {};
  BitmapDescriptor? mapMarker;

  @override
  void initState() {
    super.initState();
    setCustomMarker();
  }

  void setCustomMarker() async {
    mapMarker = await BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'images/pharmacy.png');
  }
  void _onMap(GoogleMapController controller) {
    _location.onLocationChanged.listen((l) {
      // _controller.animateCamera(
      //   CameraUpdate.newCameraPosition(
      //     CameraPosition(target: LatLng(19.456331 , 72.810211),zoom: 11),
      //   ),
      // );
    }
    );
    setState(() {
      _markers.add(Marker(markerId: MarkerId('id-1'),
          position: LatLng(19.459921, 72.808840),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Swaroop Medical',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-2'),
          position: LatLng(19.458090, 72.807295),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Vidya Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-3'),
          position: LatLng(19.456767, 72.803975),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Vinayak Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-4'),
          position: LatLng(19.455758,72.811335),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Mahalaxmi Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-5'),
          position: LatLng(19.454473,72.810696),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Maruti Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-6'),
          position: LatLng(19.455131,72.810299),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Swami Vivekanand Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-7'),
          position: LatLng(19.435108,72.816692),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Sriprastha Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-8'),
          position: LatLng(19.431653,72.823180),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Om Sainath Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-9'),
          position: LatLng(19.420393,72.815680),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Bhavani Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-10'),
          position: LatLng(19.407082,72.830135),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Shree Avdhoot Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-11'),
          position: LatLng(19.401901,72.828087),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Arpita Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-12'),
          position: LatLng(19.404785,72.840426),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Metro Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-13'),
          position: LatLng(19.403550,72.837838),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Lifeline Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-14'),
          position: LatLng(19.383856,72.828115),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Suraj Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-15'),
          position: LatLng(19.379525,72.828613),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Tak Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-16'),
          position: LatLng(19.379646,72.831060),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Seva Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-17'),
          position: LatLng(19.368432,72.817091),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Shree Sai Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-18'),
          position: LatLng(19.363179,72.803717),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Bangli Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-19'),
          position: LatLng(19.353461,72.812893),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Alpha Medical Store',
            snippet: '',
          )
      ),);
      _markers.add(Marker(markerId: MarkerId('id-20'),
          position: LatLng(19.342670,72.804546),
          icon: mapMarker!,
          infoWindow: InfoWindow(
            title: 'Bassien Medical Store',
            snippet: '',
          )
      ),);
    });
  }
  LatLng _initialcameraposition = LatLng(19.456331 , 72.810211);
  Location _location = Location();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            GoogleMap(
               onMapCreated: _onMap,
              markers: _markers,
               initialCameraPosition: CameraPosition(zoom: 11, target: _initialcameraposition),
              mapType: MapType.normal,
              myLocationButtonEnabled: true,
              myLocationEnabled: true,
              // padding: EdgeInsets.only(top: 600),
            ),
          ],
        ),
      ),
    );
  }
}