import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getUsuarios () async {

  //Creamos la variable usuarios de tipo List, para recibir los registros
  List usuarios = [];

  //Creamos una variable de tipo CollectionReference, de nombre collectionReferenceUsuarios que apunta a la collection “usuarios”
  CollectionReference collectionReferenceUsuarios = db.collection('usuarios');

  QuerySnapshot queryUsuarios = await collectionReferenceUsuarios.get();

  queryUsuarios.docs.forEach((documento) {

    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person ={
      "uid": documento.id,
      "nombre": data['nombre'],
      "email": data['email'],
      "nocuenta": data['nocuenta'],
    };
    usuarios.add(person);
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

//Este future agrega para editar usuario
Future<void> editUsuario(String uid, String eNombre, String eMail, String eCuenta) async {
  await db.collection('usuarios').doc(uid).set({
    "nombre": eNombre, 
    "email": eMail, 
    "nocuenta": eCuenta
    });
}


