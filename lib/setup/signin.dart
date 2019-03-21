import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_shares/pages/home.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        FirebaseUser user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home(user: user)));
      } catch (e) {
        print(e.message);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('res/icon/money.png'),
      ),
    );

    final email = TextFormField(
      validator: (input) {
        if (input.isEmpty) {
          return 'Введите email';
        }
      },
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onSaved: (input) => _email = input,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      ),
    );

    final password = TextFormField(
      validator: (input) {
        if (input.length < 6) {
          return 'Введите пароль не менее 6 символов';
        }
      },
      onSaved: (input) => _password = input,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
      ),
    );

    final butLogin = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: signIn,
        padding: EdgeInsets.all(12),
        color: Colors.lightBlueAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final reg = FlatButton(
      child: Text('Registration', style: TextStyle(color: Colors.black54)),
      onPressed: () {},
    );

    final labForgot = FlatButton(
      child: Text('Forgot password?', style: TextStyle(color: Colors.black54)),
      onPressed: () {},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24, right: 24),
            children: <Widget>[
              logo,
              SizedBox(
                height: 48.0,
              ),
              email,
              SizedBox(
                height: 8.0,
              ),
              password,
              SizedBox(
                height: 24.0,
              ),
              butLogin,
              reg,
              labForgot
            ],
          ),
        ),
      ),
    );
  }
}
