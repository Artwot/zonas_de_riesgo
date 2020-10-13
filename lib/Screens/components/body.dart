import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zonas_de_riesgo_app/Screens/Home_Admin/Home.dart';
import 'package:zonas_de_riesgo_app/components/rounded_button.dart';
import 'package:zonas_de_riesgo_app/components/rounded_input_email.dart';
import 'package:zonas_de_riesgo_app/components/rounded_password.dart';

import 'background.dart';

class Body extends StatelessWidget {
  String _email = 'halconm26@gmail.com';
  String _password = 'halcones2019';

  Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Esta variable tipo Size nos permite utilizar todo lo alto y ancho de la pantalla.
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "ZONA DE RIESGOS EDOMEX",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Image.asset("assets/images/edomex_logo.png", width: size.width),
            RoundedInputEmail(
              hintText: "Correo electrónico",
              onChanged: (value) {
                _email = value;
                print(value);
              },
            ),
            RoundedPassword(
              onChanged: (value) => _password = value,
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomeScreen();
                }));
              },
            ),
          ],
        ),
      ),
    );
  }

  /*Pattern pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regex = new RegExp(pattern);
                if (!regex.hasMatch(value))
                  return 'Enter Valid Email';
                else
                  return 'asdfasdf';*/
}
