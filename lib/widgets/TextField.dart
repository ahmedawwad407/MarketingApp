import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Text_Field extends StatelessWidget{
  Function saveFun;
  Function validationFun;
  String label;

  Text_Field({required this.label, required this.saveFun, required this.validationFun});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return  TextFormField(
  decoration: InputDecoration(
      labelText: label,
      fillColor: Colors.cyan,
      filled: true,
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10))),
  onSaved: (newValue)=>saveFun(newValue),
  validator: (value)=>validationFun(value)
);
  }
  
}