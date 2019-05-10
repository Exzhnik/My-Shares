import 'package:flutter/material.dart';

class LogGradient extends StatelessWidget {
  const LogGradient({
    Key key,
    @required GlobalKey<FormState> formKey,
    @required this.logo,
    @required this.email,
    @required this.password,
    @required this.butLogin,
    @required this.google,
    @required this.reg,
    @required this.labForgot,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;
  final Hero logo;
  final TextFormField email;
  final TextFormField password;
  final Padding butLogin;
  final InkWell google;
  final FlatButton reg;
  final FlatButton labForgot;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [const Color(0xFFEF9A9A), const Color(0xFF5C6DC0)],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Center(
        child: Form(
          key: _formKey,
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24, right: 24),
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [const Color(0xFF5032b6), const Color(0xFFb765d3)],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
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
              google,
              reg,
              labForgot
            ],
          ),
        ),
      ),
    );
  }
}
