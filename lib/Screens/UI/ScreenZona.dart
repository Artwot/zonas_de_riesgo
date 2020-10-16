import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:zonas_de_riesgo_app/components/text_field.dart';
import 'package:zonas_de_riesgo_app/model/municipios.dart';
import 'package:zonas_de_riesgo_app/model/zonas_riesgo.dart';

import '../../constants.dart';
class ScreenZona extends StatefulWidget {
  final Zonas_riesgo zonas_riesgo;

  ScreenZona(this.zonas_riesgo);
  @override
  _ScreenZonaState createState() => _ScreenZonaState();
}
final zonaRef = FirebaseDatabase.instance.reference().child('zonas_riesgo');
class _ScreenZonaState extends State<ScreenZona>
{
  Zonas_riesgo zonas_riesgo;
  List<Zonas_riesgo> items;

  TextEditingController  cve_igecemController;
  TextEditingController  tipo_desastreController;
  void initState() {
    super.initState();
    cve_igecemController =
    new TextEditingController(text: widget.zonas_riesgo.cve_igecem);
    tipo_desastreController =
    new TextEditingController(text: widget.zonas_riesgo.tipo_desastre);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomPadding: true,
        appBar: AppBar(
        title: Text("Añadir zona de riesgoo"),
    centerTitle: true,
    backgroundColor: kPrimaryColor,
    ), body:
    Center(
        child: Column(
          children: <Widget> [
            TextFieldContainer(
              child: TextField(
                controller: cve_igecemController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.confirmation_num,
                    color: kPrimaryColor,
                  ),
                  labelText: 'Clave IGECEM',
                  hintText: 'Clave IGECEM',
                  border: InputBorder.none,
                ),
              ),
            ),
            //Tipo de desastre
            TextFieldContainer(
              child: TextField(
                controller: tipo_desastreController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.whatshot,
                    color: kPrimaryColor,
                  ),
                  labelText: 'Tipo de desastre',
                  hintText: 'Tipo de desastre',
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              width: size.width * 0.8,
              child: ClipRect(
                //borderRadius: BorderRadius.circular(29),
                child: FlatButton(
                  padding:
                  EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  color: kPrimaryColor,
                   onPressed: () {
                    if (widget.zonas_riesgo.id != null) {
                         zonaRef.child(widget.zonas_riesgo.id).set({
                         'cve_igecem': cve_igecemController.text,
                         'tipo_desastre': tipo_desastreController.text
                         }).then((_) => {Navigator.pop(context)});
                    } else {
                     zonaRef.push().set({
                     'cve_igecem': cve_igecemController.text,
                     'tipo_desastre': tipo_desastreController.text
                    }).then((_) => {Navigator.pop(context)});
                    }
                    },
                  child: (widget.zonas_riesgo.id != null)
                      ? Text(
                    'Actualizar',
                    style: TextStyle(color: kLightColor),
                  )
                      : Text(
                    'Agregar',
                    style: TextStyle(color: kLightColor),
                  ),

                ),
              ),
            ),
          ],
        ),


    ),
    );
  }
}
