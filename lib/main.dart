import 'package:enjoyjakarta/bottomNavCtrl.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('id_ID', null).then(
    (_) => runApp(
      MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Application name
      title: 'Enjoy Jakarta',
      // Application theme data, you can set the colors for the application as
      // you want
      theme: ThemeData(
        fontFamily: "Plus Jakarta",
        primarySwatch: Colors.orange,
      ),
      // A widget which will be started on application startup
      home: BottomNavCtrl(title: 'Enjoy Jakarta'),
    );
  }
}
