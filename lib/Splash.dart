import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:untitled2/login_App.dart';
import 'package:untitled2/signup_App.dart';

class Splash_App extends StatefulWidget {
  @override
  _Splash_AppState createState() => _Splash_AppState();
}

class _Splash_AppState extends State<Splash_App> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(top: 100, left: 20),
            child: Text(
              'Buy your favourites',
              style: TextStyle(
                  fontSize: 27,
                  color: Colors.black,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Container(
            padding:
            EdgeInsets.only(top: 30, left: 100, right: 100, bottom: 50),
            child: Text(
              'You con Borwes form your marketing barnd',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
          ),
          Container(
            child: SizedBox(
              height: 400,
              width: 350,
              child: Carousel(
                boxFit: BoxFit.cover,
                autoplay: false,
                animationCurve: Curves.fastOutSlowIn,
                animationDuration: Duration(milliseconds: 1000),
                dotSize: 6.0,
                dotIncreasedColor: Colors.black,
                dotBgColor: Colors.transparent,
                dotPosition: DotPosition.bottomCenter,
                dotVerticalPadding: 5,
                showIndicator: true,
                indicatorBgPadding: 1,
                images: [
                  AssetImage('assets/images/1.jpeg'),
                  AssetImage('assets/images/2.jpeg'),
                  AssetImage('assets/images/3.jpeg'),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 20),
            width: 300,
            height: 60,
            child: RaisedButton(
              textColor: Colors.white70,
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50)),
              child: Text('START SHOPPING'),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return Login_App();
                  },
                ));
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RaisedButton(
                color: Colors.white70,
                child: Text('Sign Up'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return SignUp_App();
                    },
                  ));
                },
              ),
              Container(
                child: Text(
                  ' or ',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
              ),
              RaisedButton(
                color: Colors.white70,
                child: Text('Login In'),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return Login_App();
                    },
                  ));
                },
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
