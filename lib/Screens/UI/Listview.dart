import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zonas_de_riesgo_app/Screens/UI/ScreenMunicipio.dart';
import 'package:zonas_de_riesgo_app/constants.dart';
import 'package:zonas_de_riesgo_app/model/municipios.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';

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
  SearchBar searchBar;

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

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
      title: Text("Municipios"),
      centerTitle: true,
      backgroundColor: kPrimaryColor,
      actions: [searchBar.getSearchAction(context)],
    );
  }

  _ListViewMunicipioState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        hintText: "Buscar municipio",
        onSubmitted: (value) {
          _buscarMunicipio(value);
        },
        buildDefaultAppBar: buildAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Municipios',
      home: Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: searchBar.build(context),
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
                                color: kPrimaryColor,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            "Superficie: " +
                                '${items[index].superficie}' +
                                " km²",
                            style:
                                TextStyle(color: kGreenColor, fontSize: 18.0),
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
                          onTap: () => verMunicipio(context, items[index]),
                        ),
                      ),
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.edit,
                            color: kPrimaryColor,
                          ),
                          onPressed: () =>
                              infoMunicipio(context, items[index])),
                      IconButton(
                          icon: FaIcon(
                            FontAwesomeIcons.trashAlt,
                            color: kRedColor,
                          ),
                          onPressed: () =>
                              deleteMunicipio(context, items[index], index)),
                    ],
                  )
                ],
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: kLightColor,
          ),
          backgroundColor: kPrimaryColor,
          onPressed: () => agregarMunicipio(context),
        ),
      ),
    );
  }

  void _buscarMunicipio(String value) {
    String val = value.toUpperCase().trim();
    print("BÚSQUEDA---------------------------->" +val);
    Municipio newItem;
    for(int i = 0; i < items.length; i++){
        print(i);
        print(items[i].nombre == val);
        if(items[i].nombre == val || items[i].cve_igecem == val){
          newItem = items[i];
          break;
        }
    }
    setState(() {
      print("**************************************");
      print(newItem.poblacion);
      items.clear();
      items.add(newItem);
    });
  }

  void _addMunicipio(Event event) {
    setState(() {
      items.add(new Municipio.fromSnapShot(event.snapshot));
    });
  }

  void _updateMunicipio(Event event) {
    var oldMunicipio =
        items.singleWhere((municipio) => municipio.id == event.snapshot.key);
    setState(() {
      items[items.indexOf(oldMunicipio)] =
          new Municipio.fromSnapShot(event.snapshot);
    });
  }

  void verMunicipio(BuildContext context, Municipio municipio) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => InfoMunicipio(municipio),
        ));
  }

  deleteMunicipio(BuildContext context, Municipio municipio, index) async {
    await municipioRef.child(municipio.id).remove().then((_) {
      setState(() {
        items.removeAt(index);
      });
    });
  }

  infoMunicipio(BuildContext context, Municipio municipio) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ScreenMunicipio(municipio),
        ));
  }

  agregarMunicipio(BuildContext context) async {
    await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ScreenMunicipio(Municipio(
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                '',
                ''))));
  }
}

