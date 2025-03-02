//import 'package:app_firebase5b/services/firebase_services.dart';
import 'package:app_firebase5b/pages/add_usuario_page.dart';
import 'package:app_firebase5b/pages/edit_usuario_page.dart';
import 'package:app_firebase5b/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: '/',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const AddUsuario(),
        '/edit' : (context) => const EditUsuario(),
        },
    );
  }
}

