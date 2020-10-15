import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:zonas_de_riesgo_app/constants.dart';

class MapsScreen extends StatelessWidget {
  final String latitud;
  final String longitud;
  final String nombre;
  double dLat;
  double dLng;

  Completer<GoogleMapController> _controller = Completer();

  MapsScreen({Key key, this.latitud, this.longitud, this.nombre})
      : super(key: key);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    dLat = double.parse(this.latitud);
    dLng = double.parse(this.longitud);
    print("*******************************************");
    print(dLat);
    print(dLng);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Ubicación",
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Ubicación"),
          centerTitle: true,
          backgroundColor: kGreenColor,
        ),
        body: Stack(
          children: <Widget>[
            GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(dLat, dLng),
                zoom: 14,
              ),
              markers: _createMarkers(),
              myLocationEnabled: true,
              myLocationButtonEnabled: true,
              compassEnabled: true,
            )
          ],
        ),
      ),
    );
  }

  Set<Marker> _createMarkers() {
    var tmp = Set<Marker>();
    tmp.add(
      Marker(
        markerId: MarkerId("Cabecera Municipal"),
        position: LatLng(dLat, dLng),
        infoWindow: InfoWindow(title: "Cabecera municipal de " + this.nombre),
      ),
    );
    return tmp;
  }
}
