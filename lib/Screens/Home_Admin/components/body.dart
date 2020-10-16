import 'package:flutter/material.dart';
import 'package:zonas_de_riesgo_app/Screens/Home_Admin/components/background.dart';
import 'package:zonas_de_riesgo_app/Screens/UI/Listview.dart';
import 'package:zonas_de_riesgo_app/Screens/UI/ListviewM.dart';
import 'package:zonas_de_riesgo_app/Screens/UI/ListviewZ.dart';
import 'package:zonas_de_riesgo_app/Screens/UI/ListviewZona.dart';
import 'package:zonas_de_riesgo_app/Screens/components/body.dart';
import 'package:zonas_de_riesgo_app/components/rounded_button.dart';
import 'package:zonas_de_riesgo_app/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Bienvenido",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Image.asset(
              "assets/images/municipios_logo.png",
              height: size.height * 0.30,
            ),
            RoundedButton(
              text: "Ver Municipios",
              color: kLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) {
                    if(BodyH.usuario==1){
                      print("Eres administrador");
                      return ListViewMunicipio();
                    }else{
                      print("Eres administrador");
                      return ListViewMunicipioc();
                    }

                }));
              },
            ),
            Image.asset(
              "assets/images/riesgos.jpg",
              height: size.height * 0.30,
            ),
            RoundedButton(
              text: "Zonas de Riesgo",
              color: kPrimaryColor,
              textColor: Colors.white,
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  if(BodyH.usuario==1){
                    print("Eres administrador");
                    return ListViewZona();
                  }else{
                    print("Eres administrador");
                    return ListViewZonac();
                  }
                }));
              },
            )
          ]),
    );
  }
}
