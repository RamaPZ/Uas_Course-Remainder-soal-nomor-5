import 'package:flutter/material.dart';
import 'package:remainder_uas/model/matkul.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/info_screen.dart';

main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(MatkulAdapter());
  await Hive.openBox('matkulBox');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  @override
  void dispose() {

    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UAS Course Remainder',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      debugShowCheckedModeBanner: false,
      home: InfoScreen(),
    );
  }
}