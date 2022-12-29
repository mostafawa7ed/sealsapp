import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Editproduct extends StatefulWidget
{
  final code;
  Editproduct({Key? key,required this.code}): super(key : key);
  @override
  State<Editproduct> createState() {
    // TODO: implement createState
    return EditproductState();
  }
}
class EditproductState extends State<Editproduct>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Text("${widget.code}"),
    );
  }
}