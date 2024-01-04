import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:mad_final_paper/pages/loginPage.dart';
import 'package:mad_final_paper/pages/landingPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:firebase_auth/firebase_auth.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "AIzaSyDFaddOvIKPMxQzdn5YZt056AsXlR3xAVQ",
        appId: "1:943537906054:android:2c3294097998947c708c07",
        messagingSenderId: "943537906054",
        projectId: "mad-final-paper-786",
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MyApp(), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
