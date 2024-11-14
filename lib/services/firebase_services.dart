import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsuarios () async {

  //Creamos la variable usuarios de tipo List, para recibir los registros
  List usuarios = [];

  //Creamos una variable de tipo CollectionReference, de nombre collectionReferenceUsuarios que apunta a la collection “usuarios”
  CollectionReference collectionReferenceUsuarios = db.collection('usuarios');

  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

  queryUsuarios.docs.forEach((documento) {
    usuarios.add(documento.data());
  });

  return usuarios;
}

Future<void> agregarUsuario(String nNombre, String nEmail, String nCuenta) async {
  //CollectionReference collectionReferenceUsuarios = db.collection('usuarios');

  await db.collection('usuarios').add({
    'nombre': nNombre,
    'email': nEmail,
    'nocuenta': nCuenta,
  });
}

