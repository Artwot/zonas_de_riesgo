import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zonas_de_riesgo_app/Screens/UI/ScreenZona.dart';
import 'package:zonas_de_riesgo_app/Screens/components/background.dart';
import 'package:zonas_de_riesgo_app/constants.dart';
import 'package:zonas_de_riesgo_app/model/zonas_riesgo.dart';
import 'InfoZona.dart';

class ListViewZonac extends StatefulWidget {

  _ListViewZonacState createState() => _ListViewZonacState();



}

final zonaRef = FirebaseDatabase.instance.reference().child('zonas_riesgo');

class _ListViewZonacState extends State<ListViewZonac> {
  //Lista de las zonas:
  List<Zonas_riesgo> items;
  StreamSubscription<Event> addZona;
  StreamSubscription<Event> changeZona;
  @override
  void initState() {
    super.initState();
    items = new List();
    addZona = zonaRef.onChildAdded.listen(_addZona);
    changeZona = zonaRef.onChildChanged.listen(_updateZona);

    @override
    void dispose() {
      super.dispose();
      addZona.cancel();
      changeZona.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Zonas de Riesgo',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Zonas de riesgo"),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.only(top: 12.0),
            itemBuilder: (context, index) {
              return Column(
                children:  <Widget>[
                  Divider(height: 7.0),
                  Row(
                    children: <Widget> [
                      Expanded(
                        child: ListTile(
                          title: Text(
                            '${items[index].nombre}',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            '${items[index].tipo_desastre}',
                            style: TextStyle(
                                color: kPrimaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: Column(
                            children: <Widget>[
                              Text(
                                "IGECEM",
                                style: TextStyle(
                                    color: kBlueColor, fontSize: 12.0),
                              ),
                              CircleAvatar(
                                backgroundColor: kBlueColor,
                                radius: 16.0,
                                child: Text(
                                  '${items[index].cve_igecem}',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 14.0),
                                ),
                              )
                            ],
                          ),
                          onTap: () => verZona(context, items[index]),
                        ),
                      ),

                    ],
                  )
                ],
              );
            }
          ),
        ),

      ),
    );
  }

  void _addZona(Event event) {
    setState(() {
      items.add(new Zonas_riesgo.fromSnapShot(event.snapshot));
    });
  }

  void _updateZona(Event event) {
    var oldMunicipio =
    items.singleWhere((persona) => persona.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldMunicipio)] =
      new Zonas_riesgo.fromSnapShot(event.snapshot);
    });
  }

  void verZona(BuildContext context, Zonas_riesgo zonas_riesgo) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoZona(zonas_riesgo),
        ));
  }

  deleteZona(BuildContext context, Zonas_riesgo zonas_riesgo, index) async {
    await zonaRef.child(zonas_riesgo.id).remove().then((_) {
      setState(() {
        items.removeAt(index);
      });
    });
  }

  infoZona(BuildContext context, Zonas_riesgo zonas_riesgo) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenZona(zonas_riesgo),
        ));
  }

  agregarZona(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScreenZona(Zonas_riesgo(
                '',
                '',
                '',
                '')
            )
        )
    );
  }
}