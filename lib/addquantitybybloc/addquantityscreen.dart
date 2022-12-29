import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesappapi/addquantitybybloc/quantitycubit.dart';
import 'package:notesappapi/addquantitybybloc/quantitystate.dart';
import 'package:notesappapi/database/crud.dart';
import '../constant/functions.dart';
import '../constant/link.dart';
import '../cutomswidget/CutomTextformfaild.dart';

class AddQuntityScreen extends StatelessWidget
{
  final code ;
  AddQuntityScreen({Key? key,this.code}):super(key: key);
  TextEditingController _add_quantity = TextEditingController();
  GlobalKey<FormState> _formsatate = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context)=>DataCubit(),
      child:BlocConsumer<DataCubit,ItemdataState>(
        listener: (context,state){
            if(state is Changedata)
            {
            }
                                  },
        builder: (context,state){
          if(this.code!=null) DataCubit.get(context).get_item(this.code);
          return  Scaffold(
            appBar: AppBar(
              leading: IconButton(icon: Icon(Icons.arrow_back_outlined),onPressed: (){
                Navigator.of(context).pushNamed("addproduct");
              }),
              actions: [
              IconButton(onPressed: () async
              {
                await DataCubit.get(context).createsearch(context);
              }, icon: Icon(Icons.search))
            ],
            ),
            body: this.code==null ? Center(child:
            Text("You must select product that you went to edit it ",style: TextStyle(fontSize: 20),textAlign: TextAlign.center),
            ):
            Form(
                  key: _formsatate,
                  child: Column(children: [
                    Row(children:[SizedBox(width: get_size_app(context,true,2),),Text("name  product:",style: TextStyle(fontSize: 20)),Text("${DataCubit.get(context).name}",style: TextStyle(fontSize: get_size_app(context,true,10),))],mainAxisAlignment: MainAxisAlignment.start),
                    Row(children:[SizedBox(width: get_size_app(context,true,2),),Text("Code product:",style: TextStyle(fontSize: 20)),Text("${DataCubit.get(context).code}",style: TextStyle(fontSize: get_size_app(context,true,10),))],mainAxisAlignment: MainAxisAlignment.start),
                    Row(children:[SizedBox(width: get_size_app(context,true,2),),Text("Quantity product:",style: TextStyle(fontSize: 20)),Text("${DataCubit.get(context).last_quantity}",style: TextStyle(fontSize: get_size_app(context,true,10),))],mainAxisAlignment: MainAxisAlignment.start),
                    Row(children:[SizedBox(width: get_size_app(context,true,2),),Text("date edit product:",style: TextStyle(fontSize: 20)),Text("${DataCubit.get(context).date_edit}",style: TextStyle(fontSize: get_size_app(context,true,5),))],mainAxisAlignment: MainAxisAlignment.start),
                    CutomForm_faild(mycontroller:_add_quantity ,valid:(val){} ,hint: "new Quantity"),
                    MaterialButton(onPressed: () async {
                      Crud _crud = Crud();
                      double last = double.parse(DataCubit.get(context).last_quantity);
                      double added = double.parse(_add_quantity.value.text);
                      double res = last+added;
                      print(res);
                      var response = await _crud.postRequesr(linkupdatequantity,
                      {
                        "code": DataCubit.get(context).code,
                        "quantity": res.toString(),
                      });
                      AwesomeDialog(
                        context:(context),
                        body:Text("Edied Success",style: TextStyle(fontSize: 20)) ,
                        title: "Edied Success",
                        titleTextStyle: TextStyle(fontSize: 20),
                        dialogType: DialogType.success
                      )..show();

                    },child: Text("Edit Quantity"),color: Colors.lightBlueAccent),
                                       ],)
            ),
          );
        },
      ),
    );
  }
}