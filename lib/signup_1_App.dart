import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:untitled2/login_App.dart';
import 'package:untitled2/signup_App.dart';
import 'package:untitled2/splash.dart';
import 'package:untitled2/widgets/TextField.dart';
import 'package:string_validator/string_validator.dart';

class SingUp_1_App extends StatefulWidget {

  @override
  _SingUpState createState() => _SingUpState();
}

class _SingUpState extends State<SingUp_1_App> {
  late String userName;
  late String accountName;
  late String instagramAccount;
  late String mobile;
  late String password;
  late String email;
  late String city;
  late String confirmPassword;
  late String gender;
  late String country;
  int value=3;

  List<String> countriesL = [
    'Egypt',
    'US',
    'UK',
    'UAE',
  ];

  List<String> genderL = [
    'male',
    'female',
  ];

  GlobalKey<FormState> formKey = GlobalKey();

  saveUserName(String value) {
    this.userName = value;
  }

  saveInstagramAccount(String value) {
    this.instagramAccount = value;
  }

  saveAccountName(String value) {
    this.accountName = value;
  }

  saveMobile(String value) {
    this.mobile = value;
  }

  savePassword(String value) {
    this.password = value;
  }

  saveEmail(String value) {
    this.email = value;
  }

  saveConfirmPassword(String value) {
    this.confirmPassword = value;
  }

  saveCity(String value) {
    this.city = value;
  }

  validateUserName(value) {
    if (value == null || value == "") {
      return 'required field';
    }
  }

  validateInstagramAccount(value) {
    if (value == null || value == "") {
      return 'required field';
    }
  }

  validateCity(value) {
    if (value == null || value == "") {
      return 'required field';
    }
  }

  validateAccountName(value) {
    if (value == null || value == "") {
      return 'required field';
    }
  }

  validateMobile(value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return 'Please enter mobile number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }
    return null;
  }

  validateEmail(value) {
    if (value == null || value == "") {
      return 'required field';
    } else if (!isEmail(value)) {
      return 'wrong email syntax';
    }
  }

  validatePassword(value) {
    if (value == null || value == "") {
      return 'required field';
    } else if (value.length < 6) {
      return 'very week password';
    } else if (this.password != this.confirmPassword) {
      return 'password not matched';
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
          title: Text('SignUp_1'),backgroundColor: Colors.lightBlueAccent

      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 17),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    'Enter your data',
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Row(
                  children: [
                    RadioButton(description: 'company', value: 1, groupValue: value,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          value = 2;
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                            return SignUp_App();
                          },));
                        });
                    },
                    ),
                    RadioButton(description: 'Name', value: 2, groupValue: value,
                      onChanged: (T) {
                        print(T);
                        setState(() {
                          value = 2;
                Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                  return SingUp_1_App();
                },));
                        });
                      },
                    ),
                  ],
                ),

                Text_Field(
                    label: 'UserName',
                    saveFun: saveUserName,
                    validationFun: validateUserName),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButton<String>(
                   hint: Text('Gender'),
                    isExpanded: true,
                    underline: Container(),
                    items: genderL
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {
                      this.gender = value!;
                      setState(() {});
                    },
                  ),
                ),
                Text_Field(
                    label: 'AccountName',
                    saveFun: saveAccountName,
                    validationFun: validateAccountName),
                Text_Field(
                    label: 'instagramAccount',
                    saveFun: saveInstagramAccount,
                    validationFun: validateInstagramAccount),
                Text_Field(
                    label: 'Mobile',
                    saveFun: saveMobile,
                    validationFun: validateMobile),
                Text_Field(
                    label: 'Email',
                    saveFun: saveEmail,
                    validationFun: saveEmail),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.black)),
                  child: DropdownButton<String>(
                   hint: Text('Country'),
                    isExpanded: true,
                    underline: Container(),
                    items: countriesL
                        .map((e) => DropdownMenuItem<String>(
                              child: Text(e),
                              value: e,
                            ))
                        .toList(),
                    onChanged: (value) {
                      this.country = value!;
                      setState(() {});
                    },
                  ),
                ),
                Text_Field(
                    label: 'City',
                    saveFun: saveCity,
                    validationFun: validateCity),
                Text_Field(
                    label: 'password',
                    saveFun: savePassword,
                    validationFun: validatePassword),
                Text_Field(
                    label: 'confirmPassword',
                    saveFun: saveConfirmPassword,
                    validationFun: validatePassword),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30),
                  width: double.infinity,
                  height: 55,
                  child: RaisedButton(
                    textColor: Colors.white70,
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text('Sign Up'),
                    onPressed: () {
                      saveForm();
                    },
                  ),
                ),
                Text(
                  'Already  have account?',
                  style: TextStyle(
                      fontSize: 17,
                      color: Colors.black12,
                      fontWeight: FontWeight.normal),
                  textAlign: TextAlign.start,
                ),
                Container(
                  child: RaisedButton(
                    child: Text('Log in'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return Login_App();
                      },));
                    },
                  ),
                ),
                Container(
                  child: RaisedButton(
                    child: Text('SKIP'),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                        return Splash_App();
                      },));
                    },
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
