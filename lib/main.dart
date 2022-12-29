import 'package:flutter/material.dart';
import 'package:notesappapi/app/home.dart';
import 'package:notesappapi/app/salespage/SalesSearch.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addquantitybybloc/addquantityscreen.dart';
import 'app/add_product/add_product.dart';
import 'app/add_product/addquntity.dart';
import 'app/login.dart';
import 'app/sginup.dart';

late SharedPreferences sharedPref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "addquntity",
        initialRoute:
            sharedPref.getString("id") == null ? "login" : "salespage",
        routes: {
          "login": (context) => Login(),
          "signup": (context) => SignUp(),
          "home": (context) => Home(),
          "addproduct": (context) => AddProduct(),
          "addquntity": (context) => AddQuntity(),
          "addquantityscreen": (context) => AddQuntityScreen(),
          //todo this page  "salespage":(context)=>SalesPage(),
        });
  }
}
