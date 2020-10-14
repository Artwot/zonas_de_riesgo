import 'package:flutter/material.dart';
import 'package:zonas_de_riesgo_app/Screens/Home_Admin/components/background.dart';
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
              press: () {},
            ),
            Image.asset(
              "assets/images/riesgos.jpg",
              height: size.height * 0.30,
            ),
            RoundedButton(
              text: "Zonas de Riesgo",
              color: kPrimaryColor,
              textColor: Colors.white,
              press: () {},
            )
          ]),
    );
  }
}
