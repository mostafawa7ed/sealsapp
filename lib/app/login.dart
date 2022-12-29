import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesappapi/constant/link.dart';
import 'package:notesappapi/database/crud.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:notesappapi/main.dart';
import '../cutomswidget/CutomTextformfaild.dart';
import '../cutomswidget/vaild.dart';

class Login extends StatefulWidget
{

  Login({Key? key}):super(key: key);
  @override
  State<Login> createState() {
    return Loginstate();
  }
}
class Loginstate extends State<Login>
{
  Crud _crud = Crud();
  Login()async
  {
    print("test1");
    if(formstate.currentState!.validate())
      {
        var response = await _crud.postRequesr(linklogin,{
          "email":email.value.text,
          "password":password.value.text
        });

        if(response["status"]=="success")
          {
            sharedPref.setString("id",response["data"]["id"].toString());
            print(sharedPref.get("id"));
            sharedPref.setString("username",response["data"]["username"].toString());
            sharedPref.setString("email",response["data"]["email"].toString());
            print(" ${sharedPref.get("id")}  ${sharedPref.get("username")}  ${sharedPref.get("id")}  ${sharedPref.get("email")}");
            await Navigator.of(context).pushNamedAndRemoveUntil("addproduct", (route) => false);
          }

      }
    else
      {
        AwesomeDialog(context: context,
          dialogType: DialogType.error,
          title: "Note",
            body: Center(child: Text("Account not exist,email not correct or password",textAlign: TextAlign.center,)),
        )..show();
      }
  }
  TextEditingController email = TextEditingController();
  TextEditingController password= TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            Form(
                key:formstate,
                child: Column(children: [
              Container(child:ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(image: AssetImage('lib/image/login.jpg'),fit: BoxFit.scaleDown),
              ),
                padding: EdgeInsets.all(20),
              ),
              CutomForm_faild(hint: "Email",mycontroller: email,valid:(val)=>valinput(email.text,3)),
              CutomForm_faild(hint: "password",mycontroller: password,valid:(val)=>  valinput(password.text,2)),
              MaterialButton(onPressed: ()async
              {
               await Login();

              },
                child: Text("Login"),
                color: Colors.lightBlueAccent,
                minWidth: 100,
                padding:EdgeInsets.fromLTRB(49, 20, 49, 20) ,
              ),
              Container(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: InkWell(child: Text("SginUp"),onTap: (){
                    Navigator.of(context).pushNamed("signup");
                  },)),
            ],)),
          ],
        ),
      )

    );
  }
}
