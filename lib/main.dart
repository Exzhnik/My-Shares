import 'package:flutter/material.dart';
import 'package:my_shares/setup/signin.dart';
import 'package:my_shares/pages/home.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context)=> LoginPage(),
    Home.tag: (context)=>LoginPage(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
