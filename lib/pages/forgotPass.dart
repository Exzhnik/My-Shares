import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:my_shares/setup/signin.dart';

class ForgotPass extends StatefulWidget {
  const ForgotPass({Key key}) : super(key: key);

  @override
  _ForgotPassState createState() => _ForgotPassState();
}

class _ForgotPassState extends State<ForgotPass> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _email;

  void resetPass() async {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      try {
        await FirebaseAuth.instance.sendPasswordResetEmail(email: _email);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.only(left: 24, right: 24),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [const Color(0xFFEF9A9A), const Color(0xFF5C6DC0)],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Center(
            child: ListView(
              children: <Widget>[
                SizedBox(
                  height: 50.0,
                ),
                CircleAvatar(
                  backgroundColor: Colors.transparent,
                  radius: 48.0,
                  child: Image.asset('res/icon/money.png'),
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  validator: (input) {
                    if (input.isEmpty) {
                      return 'Email can\'t be empty';
                    }
                  },
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  onSaved: (input) => _email = input,
                  decoration: InputDecoration(
                    hintText: 'Email',
                    contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32)),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    onPressed: resetPass,
                    padding: EdgeInsets.all(12),
                    color: Colors.lightBlueAccent,
                    child: Text('Create an account',
                        style: TextStyle(color: Colors.white)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
