import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Nova importação
import 'firebase_options.dart'; // Arquivo gerado pelo flutterfire
import 'screens/main_navigator.dart';
import 'screens/login_screen.dart';


// Transformamos a main em assíncrona
void main() async {
  // Garante que os bindings do Flutter estejam prontos antes do Firebase
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializa o Firebase com as opções geradas pro seu PC/Celular
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const TramaApp());
}

class TramaApp extends StatelessWidget {
  const TramaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Trama',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF9F6F0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5A2B),
          primary: const Color(0xFF8B5A2B),
          surface: const Color(0xFFFFFDF9),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}