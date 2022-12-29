import 'package:http/http.dart' as http ;
import 'dart:convert';//to chaneg json file
class Crud
{
  getRequesr (String url) async
  {
    try{
      var response = await http.get(Uri.parse(url));
      if(response.statusCode==200)
        {
            var responsebody = await jsonDecode(response.body);
            return responsebody;
        }
      else 
        {
          print("erreor ${response.statusCode}");
        }

    }
    catch(e){
        print("Error catch $e");
    }
  }


  postRequesr (String url,Map data) async
  {
    try{
      var response = await http.post(Uri.parse(url),body: data);  //request data username and password ....
      if(response.statusCode==200)
      {
        var responsebody = await jsonDecode(response.body);
        return responsebody;
      }
      else
      {
        print("erreor ${response.statusCode}");
      }

    }
    catch(e){
      print("Error catch $e");
    }
  }

}