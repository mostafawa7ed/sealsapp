import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notesappapi/addquantitybybloc/quantitystate.dart';
import '../app/add_product/search_delegate.dart';
import '../constant/link.dart';
import '../database/crud.dart';
class DataCubit extends Cubit<ItemdataState>
{
  DataCubit():super(Datainit());
  var name;
  var code;
  var last_quantity;
  var date_edit;
  Crud _crud = Crud();
  get_item(var pathcode) async
  {

    var response = await _crud.postRequesr(linkoneitem,
        {
          "code": pathcode,
        });
    name = response['data'][0]['name'];
    last_quantity = response['data'][0]['quantity'];
    code = response['data'][0]['code'];
    date_edit = response['data'][0]['date_edit_insert'];
    emit(Changedata());
  }
  createsearch(BuildContext context)async
  {

    data_search sd = data_search();
    sd.delete_sug();
    await sd.Select_dataitem();
    showSearch(context: context, delegate: sd);
    emit(Changedata());
  }
  static DataCubit get(context)  =>BlocProvider.of(context);


}