
import 'package:flutter/material.dart';
import 'dart:ui';

///App Colors
final Color primaryColor =Color(0xff6A1E55);
final Color secondryColor =Color(0xffF2B8B8);

///FontFamily
final String montserratFont="Montserrat";
final String interFont="Inter";
final String poppinsFont="Poppins";



///FontsTextStyle
 myTextStyle12({FontWeight myFontWeight = FontWeight.normal, Color? myColors,String? myFontFamily}){
  return TextStyle(
    fontSize: 12,
    color:myColors,
    fontWeight: myFontWeight,
    fontFamily: myFontFamily
  );
}
 myTextStyle15({FontWeight myFontWeight = FontWeight.normal, Color? myColors,String? myFontFamily,}){
  return TextStyle(
    fontSize: 15,
    color:myColors,
    fontWeight: myFontWeight,
    fontFamily: myFontFamily,

  );
}
 myTextStyle16({FontWeight myFontWeight = FontWeight.normal,Color? myColors,String? myFontFamily}){
  return TextStyle(
    fontSize: 16,
    color:myColors,
    fontWeight: myFontWeight,
    fontFamily: myFontFamily
  );
}
 myTextStyle17({FontWeight myFontWeight = FontWeight.normal, Color? myColors,String? myFontFamily}){
  return TextStyle(
    fontSize: 17,
    color:myColors,
    fontWeight: myFontWeight,
    fontFamily: myFontFamily
  );
}
 myTextStyle18({FontWeight myFontWeight = FontWeight.normal, Color? myColors,String? myFontFamily}){
  return TextStyle(
    fontSize: 18,
    color:myColors,
    fontWeight: myFontWeight,
    fontFamily: myFontFamily
  );
}
 myTextStyle20({FontWeight myFontWeight = FontWeight.normal, Color? myColors,String? myFontFamily}){
  return TextStyle(
    fontSize: 20,
    color:myColors,
    fontWeight: myFontWeight,
    fontFamily: myFontFamily
  );
}
 myTextStyle26({FontWeight myFontWeight = FontWeight.normal, Color? myColors,String? myFontFamily}){
  return TextStyle(
    fontSize: 26,
    color:myColors,
    fontWeight: myFontWeight,
    fontFamily: myFontFamily
  );
}
 myTextStyle28({FontWeight myFontWeight = FontWeight.normal, Color? myColors,String? myFontFamily}){
  return TextStyle(
    fontSize: 28,
    color:myColors,
    fontWeight: myFontWeight,
    fontFamily: myFontFamily
  );
}


///Social Auth Button.
Widget buildSocialButton({String? imgPath, VoidCallback? callBack}) {
 return InkWell(
  onTap: (){
   callBack;
  },
  child: Container(
   width: 86,
   height: 42,
   padding: EdgeInsets.all(12),
   decoration: BoxDecoration(
    border: Border.all(color: Color(0xffF4F4F4)),
    borderRadius: BorderRadius.circular(8),
   ),
   child:Image(image: AssetImage(imgPath!)),
  ),
 );
}

///Rounded Button..
Widget roundedButton({required String btnName,VoidCallback? btnCallBack,String? btnFontFamily}){
  return SizedBox(
   width: double.infinity,
   height: 42,
   child: ElevatedButton(
    style: ElevatedButton.styleFrom(
     backgroundColor: primaryColor,
     shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
     ),
    ),
    onPressed: btnCallBack,
    child: Text(
     "$btnName",
     style: myTextStyle15(myFontWeight: FontWeight.w600,myColors: Colors.white,myFontFamily: btnFontFamily),
    ),
   ),
  );
}