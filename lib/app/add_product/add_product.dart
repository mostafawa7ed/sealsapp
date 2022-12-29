import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesappapi/constant/link.dart';
import 'package:notesappapi/cutomswidget/vaild.dart';
import 'package:notesappapi/main.dart';
import '../../cutomswidget/CutomTextformfaild.dart';
import 'package:notesappapi/database/crud.dart';

import '../salespage/SalesSearch.dart';

class AddProduct extends StatefulWidget
{
  AddProduct({Key? key}):super(key: key);
  @override
  State<AddProduct> createState() {
    return AddProductState();
  }
}
class AddProductState extends State<AddProduct>
{

  @override
  Widget build(BuildContext context) {
    TextEditingController pro_name = TextEditingController();
    TextEditingController pro_code = TextEditingController();
    TextEditingController pro_price=TextEditingController();
    TextEditingController pro_sale_price=TextEditingController();
    var id_user = sharedPref.getString("id");
    GlobalKey<FormState> formsatate = GlobalKey();
    Crud _crud = Crud();
    Add_product()async
    {
      //print(pro_sale_price);
      if(formsatate.currentState!.validate()) {
        try {
             print("heeeeeeeeeer");
             print("${pro_name.text} ${pro_code.text}  ${pro_price.text}  ${pro_sale_price.text}");
             print("$id_user");
          var response = await _crud.postRequesr(linkproinsert,
              {
                "pro_name": pro_name.text,
                "pro_code": pro_code.text,
                "pro_price": pro_price.text,
                "pro_sale_price": pro_sale_price.text,
                "id_user": '43'
              });
          
          response['status'];
          if(response['status']=="success")
            {
              pro_sale_price.text="";
              pro_price.text="";
              pro_code.text="";
              pro_name.text="";
              AwesomeDialog(
                dialogType: DialogType.success,
                title: "",
                context: context,
                body: Text("items added success",style: TextStyle(fontSize: 30),textAlign: TextAlign.center),
                btnOkOnPress: (){
                },
              )..show();
            }
        }
        catch (e) {
          print("${e.toString()}ddddddddddddd");
        }
      }
    }
    print(id_user);
    return Scaffold(
      body: ListView(
        shrinkWrap: true,
        children: [

          Center(
            child: Form(
              key: formsatate,
              child: Column(
                children: [
                  MaterialButton(onPressed: (){
                    Navigator.of(context).pushNamed("salespage");
                  },child: Text('seals page')),
                  CutomForm_faild(mycontroller:pro_name,hint: "name",valid: (val)=>valinput(pro_name.text, 2), ),
                  CutomForm_faild(mycontroller:pro_code,hint: "code",valid: (val)=>valinput(pro_code.text, 4), ),
                  CutomForm_faild(mycontroller:pro_price,hint: "price",valid: (val)=>valinput(pro_price.text, 4), ),
                  CutomForm_faild(mycontroller:pro_sale_price,hint: "sale_price",valid: (val)=>valinput(pro_sale_price.text, 4), ),
                  MaterialButton(onPressed: () async {
                    await Add_product();
                  },child: Text("add"),color: Colors.blue),
                  MaterialButton(onPressed: (){
                    Navigator.of(context).pushNamed("addquntity");
                  },child: Text("add qunitity"),),
                  MaterialButton(onPressed: (){
                    sharedPref.clear();
                  },child: Text("test"),)
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}