import 'package:flutter/material.dart';
import 'package:tailors_ui/screens/sign_in_screen.dart';

import '../utils/ui_helper.dart';

class SignUpScreen extends StatelessWidget {

  bool isAccepted=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 51),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              "Create your account",
              style: myTextStyle26(myFontWeight: FontWeight.w600,myFontFamily: poppinsFont),
            ),
            SizedBox(height: 24),
            //user name
            Text("Name",style: myTextStyle16(myFontFamily: poppinsFont,myColors: primaryColor),),
            SizedBox(height: 7,),
            TextField(
              decoration: InputDecoration(
                  hintText: "ex: jon smith",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff6A1E55))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColor)
                  ),
                  filled: true,
                  fillColor: Color(0xffFAFAFA)
              ),
            ),
            SizedBox(height: 12),
            // Email Field
            Text("Email",style: myTextStyle16(myFontFamily: poppinsFont,myColors: primaryColor),),
            SizedBox(height: 7,),
            TextField(
              decoration: InputDecoration(
                  hintText: "ex: jon.smith@email.com",
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Color(0xff6A1E55))
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: primaryColor)
                  ),
                  filled: true,
                  fillColor: Color(0xffFAFAFA)
              ),
            ),
            SizedBox(height: 12),
            // Password Field
            Text("Password",style: myTextStyle16(myFontFamily: poppinsFont,myColors: primaryColor),),
            SizedBox(height: 7,),
            TextField(
              style: myTextStyle15(myFontFamily: poppinsFont),
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                hintText: "Password",
                filled: true,
                fillColor: Color(0xffFAFAFA),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff6A1E55))
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: primaryColor)
                ),
              ),
            ),
            SizedBox(height: 12),
            //Confirm password
            Text("Confirm password",style: myTextStyle16(myFontFamily: poppinsFont,myColors: primaryColor),),
            SizedBox(height: 7,),
            TextField(
              style: myTextStyle15(myFontFamily: poppinsFont),
              obscureText: true,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                filled: true,
                hintText: "confirm password",
                fillColor: Color(0xffFAFAFA),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color(0xff6A1E55))
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: primaryColor)
                ),
              ),
            ),
            // SizedBox(height: 24),
            SizedBox(height: 7,),
            Row(
              spacing: 5,
              children: [
                StatefulBuilder(builder: (_,ss){
                  return Checkbox(
                    side: BorderSide(
                        color: primaryColor
                    ),
                    value: isAccepted,
                    onChanged: (value){

                      isAccepted=!isAccepted;
                      print("Only ss Rebuild");
                      ss((){});
                    },
                    activeColor: primaryColor,


                  );
                }),
                GestureDetector(
                  onTap: () {},
                  child: RichText(
                    text: TextSpan(
                      text: "I understood the ",
                      style: myTextStyle12(myColors: Color(0xff888888),myFontFamily: poppinsFont),
                      children: [
                        TextSpan(
                          text: "terms & policy.",
                          style: myTextStyle12(myFontFamily: poppinsFont,myColors: primaryColor),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 7,),
            // Sign Up Button
            roundedButton(btnName: "SIGN UP",btnCallBack: (){print("Click on SIGN UP Button");}),
            SizedBox(height: 12),
            Center(child: Text("or sign up with",style: myTextStyle16(myFontFamily: poppinsFont),)),
            SizedBox(height: 16),
            ///Social Auth Btn
            Center(
              child: Wrap(
                children: [
                  buildSocialButton(imgPath: "assets/icons/auth_icons/google.png"),
                  buildSocialButton(imgPath: "assets/icons/auth_icons/fb.png")
                ],
              ),
            ),
            SizedBox(height: 24),
            // Sign Up Link
            Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                  //Navigator.pushR(context, MaterialPageRoute(builder:(context)=>SignInScreen() ));
                },
                child: RichText(
                  text: TextSpan(
                    text: "Have an account? ",
                    style: myTextStyle16(myColors: Color(0xff888888),myFontFamily: poppinsFont),
                    children: [
                      TextSpan(
                        text: "SIGN IN",
                        style: myTextStyle16(myFontFamily: poppinsFont,myColors: primaryColor),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
