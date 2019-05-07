import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:my_shares/pages/home.dart';
import 'package:my_shares/setup/gradient.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  LoginPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> _handleSignIn() async {
  final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );

  final FirebaseUser user = await _auth.signInWithCredential(credential);
  print("signed in " + user.displayName);
  return user;
}

  /*SingIn Firebase email & password */
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
/*SingIn Firebase email & password */
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
      onPressed: () {
        _handleSignIn()
    .then((FirebaseUser user) => print(user))
    .catchError((e) => print(e));
      },
    );

    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new LogGradient(
            formKey: _formKey,
            logo: logo,
            email: email,
            password: password,
            butLogin: butLogin,
            reg: reg,
            labForgot: labForgot),
      ],
    ));
  }
}
