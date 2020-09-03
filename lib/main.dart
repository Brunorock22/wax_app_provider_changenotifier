import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:waxapp/providers/settings_provider.dart';
import 'package:waxapp/screens/home.dart';
import 'package:waxapp/service/firestore_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final FireStoreService _db = FireStoreService();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (BuildContext context) => SettingsProvider()),
        StreamProvider(
          create: (BuildContext context) => _db.getReports(),
        )
      ],
      child: MaterialApp(
        title: 'Wax App',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          accentColor: Colors.deepOrangeAccent,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Home(),
      ),
    );
  }
}
