import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled2/signup_App.dart';
import 'package:untitled2/widgets/TextField.dart';
class Login_App extends StatelessWidget {
  late  String phoneNumber;
  late String password;
  GlobalKey<FormState> formKey = GlobalKey();

  //key saved info scaffold and state scaffold
  savePhoneNumber(String value) {
    this.phoneNumber = value;
  }
  savePassword(String value) {
    this.password = value;
  }

  validatePhoneNumber(value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    }
    else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }



  validatePassword(value) {
    if (value == null || value == "") {
      return 'required field';
    } else if (value.length < 6) {
      return 'very week password';
    }
  }

  saveForm() {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
          title: Text('Login',),backgroundColor: Colors.lightBlueAccent

      ),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(

          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 40),
                alignment: Alignment.topCenter,
                child: Text(
                  'Login App',
                  style: TextStyle(fontSize: 20, color: Colors.black,fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Enter your data',
                  style: TextStyle(fontSize: 15, color: Colors.black54,fontWeight: FontWeight.normal,),
                ),
              ),
              Text_Field(
                  label: 'phone',
                  saveFun: savePhoneNumber,
                  validationFun: validatePhoneNumber,),
              Text_Field(
                  label: 'password',
                  saveFun: savePassword,
                  validationFun: validatePassword),

              Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  'forgetPassword?',
                  style: TextStyle(fontSize: 16, color: Colors.black54,fontWeight: FontWeight.normal,
                      decoration: TextDecoration.underline,decorationColor: Colors.black54),
                ),
              ),
              Container(
                width: double.infinity,
                height: 55,
                child: RaisedButton(
                  textColor: Colors.white70,
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Text('Login In'),
                  onPressed: () {
                    saveForm();
                  },
                ),
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Dont have account?',
                  style: TextStyle(fontSize: 16, color: Colors.black12,fontWeight: FontWeight.normal,),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: RaisedButton(
                  color: Colors.blueGrey,
                  child: Text('Sign up',style: TextStyle(decoration: TextDecoration.underline),),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return SignUp_App();
                    },));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}