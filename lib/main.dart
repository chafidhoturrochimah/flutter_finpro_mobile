import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_finpro_mobile/UI/splash_screen.dart';
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
    final firestore = FirestoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BarangProvider()),
        StreamProvider(
          create: (context) => firestore.getBarangs(), initialData: [],
          // initialData: initialData,
        ),
        ChangeNotifierProvider(create: (context) => KategoriProvider()),
        StreamProvider(
          create: (context) => firestore.getKategoris(), initialData: [],
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
        home: SplashScreen(),
      ),
    );
  }
}
