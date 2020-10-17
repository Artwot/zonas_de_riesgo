import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zonas_de_riesgo_app/Screens/Maps/MapsScreen.dart';
import 'package:zonas_de_riesgo_app/model/zonas_riesgo.dart';
import '../../constants.dart';
class InfoZona extends StatefulWidget {
  final Zonas_riesgo zonas_riesgo;
  InfoZona(this.zonas_riesgo);
  @override
  _InfoZonaState createState() => _InfoZonaState();
}

final zonaRef = FirebaseDatabase.instance.reference().child('zonas_riesgo');

class _InfoZonaState extends State<InfoZona> {
  List<Zonas_riesgo> items;

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   return Scaffold(
     appBar: AppBar(
       title: Text('Información'),
       centerTitle: true,
       backgroundColor: kPrimaryColor,
     ),
      body: Center(
        child: ListView.builder(
             itemCount: 1,
             padding: EdgeInsets.only(top: 12.0),
             itemBuilder: (context, index) {
               return Container(
                 height: 1000.0,
                 padding: const EdgeInsets.all(20.0),
                 child: Card(
                   child: Center(
                     child: Column(
                       children:  <Widget> [
                         new Text(
                           "${widget.zonas_riesgo.nombre}",
                           style: TextStyle(
                             fontWeight: FontWeight.normal,
                             fontSize: 16.0,
                           ),
                         ),
                         new Text(
                           "Municipio",
                           style: TextStyle(
                               color: kPrimaryColor,
                               fontWeight: FontWeight.bold),
                         ),
                         Padding(padding: EdgeInsets.only(top: 8.0)),
                         Divider(),
                         new Text(
                           "${widget.zonas_riesgo.cve_igecem}",
                           style: TextStyle(
                             fontWeight: FontWeight.normal,
                             fontSize: 16.0,
                           ),
                         ),
                         new Text(
                           "Clave IGECEM",
                           style: TextStyle(
                               color: kPrimaryColor,
                               fontWeight: FontWeight.bold),
                         ),
                         Padding(padding: EdgeInsets.only(top: 8.0)),
                         Divider(),
                         new Text(
                           "${widget.zonas_riesgo.tipo_desastre}",
                           style: TextStyle(
                             fontWeight: FontWeight.normal,
                             fontSize: 16.0,
                           ),
                         ),
                         new Text(
                           "Tipo de desastre",
                           style: TextStyle(
                               color: kPrimaryColor,
                               fontWeight: FontWeight.bold),
                         ),
                         Padding(padding: EdgeInsets.only(top: 8.0)),
                         Divider(),
                         SizedBox(
                           height: size.height * 0.05,
                         ),
                         Image.asset("assets/images/mapa.jpeg", width: size.width),
                       ],
                     ),
                   ),
                 ),
               );
             },

        ),
      ),
   );
  }

}

