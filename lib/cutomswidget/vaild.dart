//type is 1 is text
//type is 2 is username
//type is 3 is email
//type is 4 is password
//type is 5 is number
import 'package:email_validator/email_validator.dart';
valinput(String val,int type)
{
  if(val.length!=0) {
          if(type==1)
              {
                           return null;
              }
          else if(type==2) {

                     if (val.length < 5) {
                      return "must username > 4";
                                      }
                     else if(val.length>25)
                       {
                         return "must user name <26";
                       }
                     else {
                       return null;
                     }
                          }
          else if (type==3)
                {
                  bool vald = EmailValidator.validate(val);
  //                print(vald);
//                  print(val);
                  if(vald ==true)
                    {
                      return null;
                    }
                  else
                    {
                      return "email not vald";
                    }
                }
          else if (type ==4)
          {
            double dval = double.parse(val);
            print(dval);
            if(dval>=0)
            {
              return null;
            }
            else
            {
              return "data must be number";
            }
          }
          else
            {
              return null;
            }

  }
  else
    {
      return "val is null must enter val";
    }
  // if(val.length<min)
  //   {
  //     return "min need increse";
  //   }
}