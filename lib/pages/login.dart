import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _email = TextEditingController();
  final _password = TextEditingController();

  void getToken(email,password) async {
    try {
      Response response = await post('http://reviewbhai.somee.com/token');
      print(response);
    }
    catch(e) {
      print('Error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          padding: EdgeInsets.symmetric(
            horizontal: 40.0,
            vertical: 120.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                child: TextField(
                  controller: _email,
                  style: TextStyle(
                      color: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.blue[300],
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Enter Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[300]),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[300]),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      )
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                width: double.infinity,
                child: TextField(
                  obscureText: true,
                  controller: _password,
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue[300],
                      contentPadding: EdgeInsets.all(15.0),
                      hintText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[300]),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[300]),
                        borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      ),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.white,
                      )
                  ),
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                width: double.infinity,
                child: RaisedButton(
                  onPressed: () {
                    print(_email.text);
                    print(_password.text);
                    getToken(_email, _password);
                    },
                  elevation: 2.0,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Text(
                    'Login',
                    style: (
                    TextStyle(
                      color: Colors.indigo,
                    )
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
