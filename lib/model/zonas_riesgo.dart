import 'package:firebase_database/firebase_database.dart';

class Zonas_riesgo
{
  String id;
  String nombre;
  String cve_igecem;
  String tipo_desastre;
  Zonas_riesgo
      (
      this.id,
      this.nombre,
      this.cve_igecem,
      this.tipo_desastre
      );
  Zonas_riesgo.map(dynamic obj) {
    this.cve_igecem = obj['cve_igecem'];
    this.nombre = obj['nombre'];
    this.tipo_desastre=obj['tipo_desastre'];
  }
  String get getid=> id;
  String get getnombre=> nombre;
  String get getcve_igecem=> cve_igecem;
  String get gettipo_desastre=> tipo_desastre;

  Zonas_riesgo.fromSnapShot(DataSnapshot snapshot) {
    id = snapshot.key;
    nombre = snapshot.value['nombre'];
    cve_igecem = snapshot.value['cve_igecem'];
    tipo_desastre = snapshot.value['tipo_desastre'];

  }
}