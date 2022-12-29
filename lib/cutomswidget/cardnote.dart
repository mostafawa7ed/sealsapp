import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardNote extends StatelessWidget
{
  final title;
  final content;
  final void Function()? onTap;
  CardNote({Key? key,required this.onTap,required this.title,required this.content}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            Expanded(child:Image.asset("lib/image/login.jpg",width: 100,height: 100,fit: BoxFit.fill,),flex: 1),
            Expanded(child: ListTile(
              title: Text("$title"),
              subtitle: Text("$content"),
            ),
              flex: 4,
            )
          ],
        ),
      ),
    );

      ;
  }
}