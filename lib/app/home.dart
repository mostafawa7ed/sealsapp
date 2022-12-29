import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesappapi/constant/link.dart';
import 'package:notesappapi/cutomswidget/cardnote.dart';
import 'package:notesappapi/main.dart';

import '../database/crud.dart';

class Home extends StatefulWidget
{
  Home({Key? key}) :super(key: key);
  @override
  State<Home> createState() {
   return HomeState();
  }
}
class HomeState extends State<Home> with Crud
{
  getNotes() async
  {
    print(sharedPref.getString("id"));
    var response = await postRequesr(linkView, {
      "userid":sharedPref.getString("id"),
    });
    print(response);
    return response;
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            sharedPref.clear();
            Navigator.of(context).pushNamedAndRemoveUntil("login", (route) => false);
    }, icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
              FutureBuilder(
                  future:getNotes() ,
                  builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.hasData)
                  {
                    print(snapshot.data['status']);
                    if(snapshot.data['status']=="fail") return Center(child: Text("not have Notes"),);
                    return ListView.builder(
                      itemCount: snapshot.data["data"].length,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                          return CardNote(title: "${snapshot.data["data"][index]['note_title']}" ,content:"${snapshot.data["data"][index]['note_content']}" ,onTap:(){} ,);
                    },);

                  }
                if(snapshot.connectionState==ConnectionState.waiting)
                  {
                    return Center(child: CircularProgressIndicator(),);
                  }
                return Center(child: Text("Error 404"),);

              })

          ],
        ),
      ),

    );
  }
}