import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todoooappppppp/home/homepage.dart';

void main() async{
  await Hive.initFlutter();
  var box=await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // Define the default brightness and colors.
          // Define the default font family.
          // Define the default `TextTheme`. Use this to specify the default
          // text styling for headlines, titles, bodies of text, and more.
      primarySwatch: Colors.green,

          appBarTheme: AppBarTheme(
            color: Colors.yellow
          )
        ),
      home:homepage()
    );
  }
}
