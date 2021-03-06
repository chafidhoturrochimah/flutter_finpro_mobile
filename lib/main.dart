import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/UI/onboarding/landing.dart';
import 'package:provider/provider.dart';
import 'firestore/helper/firestore.dart';
import 'firestore/providers/barang_provider.dart';
import 'firestore/providers/kategori_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final firestoreService = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BarangProvider()),
        StreamProvider(
          create: (context) => firestoreService.getBarang(),
          initialData: null,
          // initialData: initialData,
        ),
        ChangeNotifierProvider(create: (context) => KategoriProvider()),
        StreamProvider(
          create: (context) => firestoreService.getKategori(),
          initialData: null,
          //  initialData: initialData,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My Stock',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.light,
        ),
        home: AnimatedSplashScreen(
          splash: Image.asset(
            'assets/flaticon.png',
          ),
          nextScreen: Landing(),
          splashTransition: SplashTransition.scaleTransition,
          backgroundColor: Colors.purple[50],
          //duration: 3000,
        ),
      ),
    );
  }
}
