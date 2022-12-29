import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesappapi/constant/link.dart';
import 'package:notesappapi/database/crud.dart';
import '../cutomswidget/CutomTextformfaild.dart';
import '../cutomswidget/vaild.dart';

class SignUp extends StatefulWidget
{

  SignUp({Key? key}):super(key: key);
  @override
  State<SignUp> createState() {
    return SignUpstate();
  }
}
class SignUpstate extends State<SignUp>
{
  Crud _crud=Crud();
  TextEditingController email = TextEditingController();
  TextEditingController password= TextEditingController();
  TextEditingController Username = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey();
  SignUp()async
  {
    if(formstate.currentState!.validate())
      {
        var response =  await _crud.postRequesr(linkSignup, {
          "username":Username.text,
          "email":email.text,
          "password":password.text
        });
        print(response);
        if(response["status"] =="success")
        {
          Navigator.of(context).pushNamedAndRemoveUntil("home",(route) => false,);
        }
        else
        {
          print("signup faid");
        }
      }
    else
      {
        print("gh asda");
      }
  }
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
                    CutomForm_faild(hint: "UserName",mycontroller: Username,valid:(val)=> valinput(Username.text,2)),
                    CutomForm_faild(hint: "Email",mycontroller: email,valid:(val)=>  valinput(email.text,3)),
                    CutomForm_faild(hint: "password",mycontroller: password,valid:(val)=>  valinput(password.text,2)),
                    MaterialButton(onPressed: () async {
                      //print("${email.text}dddd${Username.text}dddd${password.text}");
                      await SignUp();
                      //Navigator.of(context).pushNamed("home");
                    },
                      child: Text("Login"),
                      color: Colors.lightBlueAccent,
                      minWidth: 100,
                      padding:EdgeInsets.fromLTRB(49, 20, 49, 20) ,
                    ),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: InkWell(child: Text("Login"),onTap: (){
                          Navigator.of(context).pushNamed("login");
                        },)),
                  ],)),
            ],
          ),
        )

    );
  }
}
