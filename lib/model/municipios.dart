//Modelo con la BD que contendrá los datos para Firebase.

import 'package:firebase_database/firebase_database.dart';

class Municipio {
  //Datos de la BD:
  String id;
  String nombre;
  String cve_igecem;
  String cabecera_municipal;
  String altitud;
  String significado;
  String poblacion;
  String volcan;
  String altitud_volcan;
  String canales_rios;
  String longitud;
  String cuerpos_agua;
  String capacidad;
  String calido;
  String semiarido;
  String seco;
  String templado;
  String semifrio;
  String frio;
  String lat;
  String long;
  String superficie;

  Municipio(
      this.id,
      this.nombre,
      this.cve_igecem,
      this.cabecera_municipal,
      this.altitud,
      this.significado,
      this.poblacion,
      this.volcan,
      this.altitud_volcan,
      this.canales_rios,
      this.longitud,
      this.cuerpos_agua,
      this.capacidad,
      this.calido,
      this.semiarido,
      this.seco,
      this.templado,
      this.semifrio,
      this.frio,
      this.lat,
      this.long,
      this.superficie);

  //Mapeo para estructurar los datos:
  Municipio.map(dynamic obj) {
    this.nombre = obj['nombre'];
    this.cve_igecem = obj['cve_igecem'];
    this.cabecera_municipal = obj['cabecera_municipal'];
    this.altitud = obj['altitud'];
    this.significado = obj['significado'];
    this.poblacion = obj['poblacion'];
    this.volcan = obj['volcan'];
    this.altitud_volcan = obj['altitud_volcan'];
    this.canales_rios = obj['canales_rios'];
    this.longitud = obj['longitud'];
    this.cuerpos_agua = obj['cuerpos_agua'];
    this.capacidad = obj['capacidad'];
    this.calido = obj['calido'];
    this.semiarido = obj['semiarido'];
    this.seco = obj['seco'];
    this.templado = obj['templado'];
    this.semifrio = obj['semifrio'];
    this.frio = obj['frio'];
    this.lat = obj['lat'];
    this.long = obj['long'];
    this.superficie = obj['superficie'];
  }

  //Getters de las variables.
  String get getid => id;
  String get getnombre => nombre;
  String get getcve_igecem => cve_igecem;
  String get getcabecera_municipal => cabecera_municipal;
  String get getaltitud => altitud;
  String get getsignificado => significado;
  String get getpoblacion => poblacion;
  String get getvolcan => volcan;
  String get getaltitud_volcan => altitud_volcan;
  String get getcanales_rios => canales_rios;
  String get getlongitud => longitud;
  String get getcuerpos_agua => cuerpos_agua;
  String get getcapacidad => capacidad;
  String get getcalido => calido;
  String get getsemiarido => semiarido;
  String get getseco => seco;
  String get gettemplado => templado;
  String get getsemifrio => semifrio;
  String get getfrio => frio;
  String get getlat => lat;
  String get getlong => long;
  String get getsuperficie => superficie;

  //Para crear una tabla en Firebase:
  Municipio.fromSnapShot(DataSnapshot snapshot) {
    id = snapshot.key;
    nombre = snapshot.value['nombre'];
    cve_igecem = snapshot.value['cve_igecem'];
    cabecera_municipal = snapshot.value['cabecera_municipal'];
    altitud = snapshot.value['altitud'];
    significado = snapshot.value['significado'];
    poblacion = snapshot.value['poblacion'];
    volcan = snapshot.value['volcan'];
    altitud_volcan = snapshot.value['altitud_volcan'];
    canales_rios = snapshot.value['canales_rios'];
    longitud = snapshot.value['longitud'];
    cuerpos_agua = snapshot.value['cuerpos_agua'];
    capacidad = snapshot.value['capacidad'];
    calido = snapshot.value['calido'];
    semiarido = snapshot.value['semiarido'];
    seco = snapshot.value['seco'];
    templado = snapshot.value['templado'];
    semifrio = snapshot.value['semifrio'];
    frio = snapshot.value['frio'];
    lat = snapshot.value['lat'];
    long = snapshot.value['long'];
    superficie = snapshot.value['superficie'];
  }
}
