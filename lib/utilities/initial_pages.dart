import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:smit/services/authentication.dart';
import 'package:smit/services/loading.dart';
import 'package:smit/services/user_database.dart';
import 'package:smit/services/users.dart';
import 'custom_widgets.dart';
import '../services/pagerouter.dart';

class SetPassword extends StatefulWidget {
  final String email;

  const SetPassword({Key key, this.email}) : super(key: key);

  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  TextEditingController _password = TextEditingController();
  TextEditingController _confirmpassword = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String _conf;
  String _pass;
  final AuthService _auth = AuthService();
  String error = "";
  bool _loading = false;

  _buttonpressed() {
    print("Button Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Password_Background(),
            Positioned(
              top: 190.0,
              bottom: 230.0,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      child: Text(
                        "SET PASSWORD",
                        style: largeTextStyle(),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "However, let's talk some security!",
                          style: smallTextStyle(myOrange),
                        ),
                        SizedBox(
                          width: 180.0,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0, bottom: 5.0),
                      child: Material(
                        child: customtextfield(
                          validator: (_pass) => _pass.length < 6
                              ? "Password Must Be 6 Characters"
                              : null,
                          obscure: true,
                          text: "New Password",
                          controller: _password,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0, bottom: 5.0),
                      child: Material(
                        child: customtextfield(
                          validator: (_conf) =>
                              _conf == _pass ? null : "Passwords Don't Match",
                          obscure: true,
                          text: "Confirm Password",
                          controller: _confirmpassword,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: CustomButton(
                        text: "Secure Me",
                        color: myOrange,
                        textcolor: Colors.white,
                        callback: () async {
                          setState(() {
                            _pass = _password.text;
                            _conf = _confirmpassword.text;
                          });
                          if (_formkey.currentState.validate()) {
                            setState(() => _loading = true);
                            dynamic result =
                                await _auth.register(widget.email, _pass);
                            if (result == null) {
                              error = "Enter A Valid ID";
                              setState(() {
                                _loading = false;
                              });
                            } else {
                              print('Updating User Data');
                              UserData us=UserData();
                              await DatabaseService(uid: result.uid)
                                  .updateUserData(us);
                              Navigator.pushNamed(context, '/update_profile',
                                  arguments: us);
                              print(result.uid);
                            }
                          }
//                          Navigator.pushNamed(context, "/home");
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            (_loading)
                ? Loading()
                : Container(
                    height: 1.0,
                    width: 1.0,
                  )
          ],
        ),
      ),
    ));
  }
}

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _registration = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String _email;

  _buttonpressed() {
    print("Button Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Initial_Background(),
            Positioned(
              top: 190.0,
              bottom: 230.0,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "REGISTER",
                      style: largeTextStyle(),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Just let us know your...",
                          style: smallTextStyle(myOrange),
                        ),
                        SizedBox(
                          width: 250.0,
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                    ),
                    customtextfield(
                        validator: (_email) =>
                            _email.contains('@') ? null : "Enter Valid Email",
                        text: "Email Address",
                        kbtype: TextInputType.emailAddress,
                        controller: _registration),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                    ),
                    Row(
                      children: <Widget>[
                        SizedBox(
                          width: 250.0,
                        ),
                        Text(
                          "and we will do the rest!",
                          style: smallTextStyle(myOrange),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    CustomButton(
                      text: "Let's Get Started",
                      textcolor: Colors.white,
                      callback: () {
                        setState(() {
                          _email = _registration.text;
                        });
                        if (_formkey.currentState.validate()) {
                          Navigator.pushNamed(context, '/set_password',
                              arguments: _email);
                        }
                      },
                      color: myOrange,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email;
  String _pass;
  bool _success = true;
  bool _loading = false;
  TextEditingController _password = TextEditingController();
  TextEditingController _registration = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    //Background Image of the Initial Login and Initial Pages
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Initial_Background(),
            Positioned(
              top: 200.0,
              bottom: 210.0,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      child: Text(
                        "LOGIN",
                        style: largeTextStyle(),
                      ),
                    ),
                    (_success)
                        ? Container()
                        : Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Invalid Credentials",
                              style: smallTextStyle(Colors.red),
                            ),
                          ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0, bottom: 5.0),
                      child: Material(
                        child: customtextfield(
                          validator: (_email) =>
                              _email.contains('@') ? null : "Enter Valid Email",
                          text: "Enter Email",
                          controller: _registration,
                          kbtype: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0, bottom: 5.0),
                      child: Material(
                        child: customtextfield(
                          text: "Enter Password",
                          controller: _password,
                          obscure: true,
                        ),
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                            width: 120.0,
//                          margin: EdgeInsets.only(left: 15.0),
                            child: FlatButton(
                              splashColor: Colors.black12,
                              onPressed: () =>
                                  {Navigator.pushNamed(context, '/register')},
                              child: Wrap(
                                children: <Widget>[
                                  Text("New User?",
                                      style: smallTextStyle(myOrange)),
                                  Text("Register Here",
                                      style: smallTextStyle(myOrange))
                                ],
                              ),
                            )),
                        SizedBox(
                          width: 160.0,
                        ),
                        Container(
                            width: 140.0,
                            alignment: Alignment.bottomRight,
//                          margin: EdgeInsets.only(right: 15.0),
                            child: FlatButton(
                              splashColor: Colors.black12,
                              onPressed: () => {
                                Navigator.pushNamed(context, '/forgot_password')
                              },
                              child: Text(
                                "Forgot Password",
                                style: smallTextStyle(myOrange),
                              ),
                            ))
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: CustomButton(
                        textcolor: Colors.white,
                        text: "LOGIN",
                        color: myOrange,
                        callback: () async {
                          setState(() {
                            _email = _registration.text;
                            _pass = _password.text;
                          });
                          if (_formkey.currentState.validate()) {
                            setState(() {
                              _loading = true;
                            });
                            dynamic result = await _auth.SignIn(_email, _pass);
                            if (result == null) {
                              setState(() {
                                _loading = false;
                                _success = false;
                                _registration.text = "";
                                _password.text = "";
                              });
                            } else {
                              print("In Navigator");
                              Navigator.pushReplacementNamed(context, '/home',
                                  arguments: result);
                            }
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            (_loading)
                ? Loading()
                : Container(
                    height: 1.0,
                    width: 1.0,
                  )
          ],
        ),
      ),
    ));
  }
}

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  TextEditingController _registration = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  String _email;
  AuthService _auth = AuthService();
  bool _success = true;

  _buttonpressed() {
    print("Button Pressed");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Password_Background(),
            Positioned(
              top: 200.0,
              bottom: 230.0,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Material(
                      child: Text(
                        "FORGOT PASSWORD",
                        style: largeTextStyle(),
                      ),
                    ),
                    (_success)
                        ? Container()
                        : Container(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Check Your Email for Password Reset",
                              style: smallTextStyle(mygreen),
                            ),
                          ),
                    Row(
                      children: <Widget>[
                        Text(
                          "We have got you covered!",
                          style: smallTextStyle(myOrange),
                        ),
                        SizedBox(
                          width: 230.0,
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(3.0),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 2.0, bottom: 5.0),
                      child: Material(
                        child: customtextfield(
                          validator: (_email) =>
                              _email.contains('@') ? null : "Enter Valid Email",
                          text: "Enter Email",
                          controller: _registration,
                          kbtype: TextInputType.emailAddress,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: CustomButton(
                          text: "Confirm",
                          color: myOrange,
                          textcolor: Colors.white,
                          callback: () async {
                            if (_formkey.currentState.validate()) {
                              setState(() {
                                _email = _registration.text;
                                _success = false;
                              });
                              await _auth.forgotpassword(_email);
                              Navigator.pushNamed(context, '/');
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

TextStyle smallTextStyle(Color col) {
  return TextStyle(fontFamily: "Lato", color: col, fontWeight: FontWeight.w700);
}

TextStyle largeTextStyle() {
  return TextStyle(
      fontFamily: "Poppins",
      fontWeight: FontWeight.w700,
      fontSize: 35.0,
      color: myOrange);
}
