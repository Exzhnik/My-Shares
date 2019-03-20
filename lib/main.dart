import 'package:flutter/material.dart';
import 'package:my_shares/setup/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // created login form
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(title: 'Flutter Demo Home Page'),
    );
  }
}

