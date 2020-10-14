import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zonas_de_riesgo_app/Screens/components/background.dart';
import 'package:zonas_de_riesgo_app/constants.dart';
import 'package:zonas_de_riesgo_app/model/municipios.dart';

import 'InfoMunicipio.dart';

class ListViewMunicipio extends StatefulWidget {
  @override
  _ListViewMunicipioState createState() => _ListViewMunicipioState();
}

//Referencias a la tabla de Firebase:
final municipioRef = FirebaseDatabase.instance.reference().child('municipio');

class _ListViewMunicipioState extends State<ListViewMunicipio> {
  //Lista de los municipios:
  List<Municipio> items;
  StreamSubscription<Event> addMunicipio;
  StreamSubscription<Event> changeMunicipio;

  @override
  void initState() {
    super.initState();
    items = new List();
    addMunicipio = municipioRef.onChildAdded.listen(_addMunicipio);
    changeMunicipio = municipioRef.onChildChanged.listen(_updateMunicipio);

    @override
    void dispose() {
      super.dispose();
      addMunicipio.cancel();
      changeMunicipio.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Municipios',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          title: Text("Municipios"),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: Center(
          child: ListView.builder(
            itemCount: items.length,
            padding: EdgeInsets.only(top: 12.0),
            itemBuilder: (context, index) {
              return Column(
                children: <Widget>[
                  Divider(height: 7.0),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: ListTile(
                          title: Text(
                            '${items[index].nombre}',
                            style: TextStyle(
                                color: kBlueColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Superficie: " +
                                '${items[index].superficie}' +
                                " km²",
                            style:
                                TextStyle(color: kOrangeColor, fontSize: 18.0),
                          ),
                          leading: Column(
                            children: <Widget>[
                              Text(
                                "IGECEM",
                                style: TextStyle(
                                    color: kGreenColor, fontSize: 12.0),
                              ),
                              CircleAvatar(
                                backgroundColor: kLightColor,
                                radius: 16.0,
                                child: Text(
                                  '${items[index].cve_igecem}',
                                  style: TextStyle(
                                      color: kPrimaryColor, fontSize: 14.0),
                                ),
                              )
                            ],
                          ),
                          onTap: () => verMunicipio(context, items[index]),
                        ),
                      )
                    ],
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  void _addMunicipio(Event event) {
    setState(() {
      items.add(new Municipio.fromSnapShot(event.snapshot));
    });
  }

  void _updateMunicipio(Event event) {
    var oldPersona =
        items.singleWhere((persona) => persona.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldPersona)] =
          new Municipio.fromSnapShot(event.snapshot);
    });
  }

  /*void infoMunicipio(BuildContext context, Municipio municipio) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenMunicipio(municipio),
        ));
  }*/

  void verMunicipio(BuildContext context, Municipio municipio) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoMunicipio(municipio),
        ));
  }
}
