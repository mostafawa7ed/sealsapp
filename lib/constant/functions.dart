import 'package:flutter/cupertino.dart';

 get_size_app(BuildContext context,bool type,int percentage)   //type for width or hight ... percentage for page
{
 var res;
 if(type==true)//width
     {
       res = ((MediaQuery.of(context).size.width* percentage)/100);
  return res;
     }
 if(type=false)//height
  {
  res = ((MediaQuery.of(context).size.height* percentage)/100);
  return res;
 }
  }