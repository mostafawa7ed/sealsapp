import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CutomForm_faild extends StatelessWidget
{
  final hint;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  CutomForm_faild({Key? key,required this.hint,this.mycontroller,required this.valid}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        decoration: InputDecoration(
          hintText: hint,
          contentPadding: EdgeInsets.all(15),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2,color: Colors.lightBlueAccent)
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2,color: Colors.amber),
          )
        ),
      ),
    );
  }
}