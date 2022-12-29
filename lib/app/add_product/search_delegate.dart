import 'package:flutter/material.dart';
import 'package:notesappapi/database/crud.dart';
import 'package:notesappapi/main.dart';

import '../../addquantitybybloc/addquantityscreen.dart';
import '../../constant/link.dart';
import 'Editproduct.dart';
import 'addquntity.dart';

class data_search extends SearchDelegate
{
  List names=[];
  List codes=[];
  List ids=[];
  List quantity=[];
  List datee=[];
  Crud _crud=Crud();
  delete_sug()
  {
    names=[];
    codes=[];
    ids=[];
    quantity=[];
    datee=[];
  }
  Select_dataitem()async
  {
    print("heeeeeeeeeer");
    print(sharedPref.getString("id"));
    var response =await _crud.postRequesr(linkitemcount,
    {
      "userid":sharedPref.getString("id")
    }
    );
    print("heeeeeeeeeer");
    if(response["status"]=="success");
    {
      print("success");
      //var i=0;
      //print(response['data'].length);
      for(var i=0 ;response['data'].length>i;i++)
        {
         //print(response['data'][i]);
         response['data'][i].forEach((k,v){
             if (k == "id") print("sssss");
             //print(response['data'][i][k]);
             if (k == 'name') {
               // print(k);
               names.add(v);
             }
             if (k == 'code') {
               codes.add(v);
             }
             if (k == "id")
            {
             ids.add(v);
            }
             if(k=='quantity')
             {
                 quantity.add(v);
             }
             if(k=='date_edit_insert')
               {
                 datee.add(v);
               }
         });
        }
      }
      print(names);
  }
@override
List<Widget>? buildActions(BuildContext context)  {

  return [
    IconButton(onPressed: ()  {

      query="";
    }, icon: Icon(Icons.close))
  ];

}

@override
Widget? buildLeading(BuildContext context) {
  return  IconButton(onPressed: (){
    close(context, null);
  }, icon: Icon(Icons.backspace_outlined));
}

@override
Widget buildResults(BuildContext context) {

  return Text("$query");
}

@override
Widget buildSuggestions(BuildContext context) {
  List filternames =names.where((element) => element.startsWith(query)).toList();
  return ListView.builder(itemCount:query=="" ? names.length:filternames.length

      ,itemBuilder: (context,i)
      {
        return InkWell(
          onTap: (){
            query =query=="" ? names[i]:filternames[i];
            //sharedPref.setString("editpro", codes[i]);
           Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: ( context)=>AddQuntityScreen(code:codes[i])),(route) => false);
          },
          child:   Container(padding: EdgeInsets.all(10),
            child:query =="" ? Text("  ${names[i]}",style: TextStyle(fontSize: 20),):
            Text("${filternames[i]}"),
          ),
        );
      }
  ) ;
}

}

