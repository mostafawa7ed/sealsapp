import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notesappapi/app/add_product/search_delegate.dart';
import 'package:notesappapi/database/crud.dart';

import '../../constant/link.dart';
import '../../cutomswidget/CutomTextformfaild.dart';

class AddQuntity extends StatefulWidget
{
  final code ;
  AddQuntity({Key? key,this.code}):super(key: key);
  @override
  State<AddQuntity> createState() {
    return AddQuntityState();
  }
}

class AddQuntityState extends State<AddQuntity>
{
  TextEditingController _pro_name = TextEditingController();
  TextEditingController _pro_code = TextEditingController();
  TextEditingController _pro_price=TextEditingController();
  TextEditingController _pro_sale_price=TextEditingController();
  GlobalKey<FormState> _formsatate = GlobalKey();
  var name;
  var code;
  var last_quantity;
  var add_Quantity;
  Crud _crud = Crud();
  get_item() async
  {
    var response = await _crud.postRequesr(linkoneitem,
        {
          "code": widget.code,
        });
    name = response['data'][0]['name'];
    last_quantity = response['data'][0]['quantity'];
    code = response['data'][0]['code'];
    //_pro_name.value= response['data']['name'];
    //print(response);
    _pro_name.text=response['data'][0]['name'];
  }
  @override
  void initState()  {
    if(widget.code!=null) {
      get_item();
      print(name);
    }
    print(widget.code);
    ///code herrre api get data to product


    super.initState();
  }
  @override
  data_search sd=data_search();
  Widget build(BuildContext context) {
    setState(() {
      
    });
    return Scaffold(
      appBar: AppBar(	actions: [
          IconButton(onPressed: () async
          {
            sd.delete_sug();
          await sd.Select_dataitem();
    showSearch(context: context, delegate: sd);
    }, icon: Icon(Icons.search))
    ],
    ),
      body: widget.code==null ? Center(child:
          Text("You must select product that you went to edit it ",style: TextStyle(fontSize: 20),textAlign: TextAlign.center),
          ):
      Form(
          key: _formsatate,
          child: Column(children: [
            Text("$code"),
        Text("$name"),
        CutomForm_faild(mycontroller:_pro_name ,valid:(val){} ,hint: "",),
        CutomForm_faild(mycontroller:_pro_name ,valid:(val){} ,hint: "",),
        CutomForm_faild(mycontroller:_pro_name ,valid:(val){} ,hint: "",),
        CutomForm_faild(mycontroller:_pro_name ,valid:(val){} ,hint: "",),
      ],)
      )

      ,
    );
  }
}