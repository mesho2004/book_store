import 'package:book_store/screens/home_screen.dart';
import 'package:book_store/screens/main_screen.dart';
import 'package:flutter/material.dart';

main(){
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: mainScreen(),
    );
  }
}
