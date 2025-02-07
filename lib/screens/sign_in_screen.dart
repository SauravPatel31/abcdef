import 'package:flutter/material.dart';
import 'package:tailors_ui/screens/intro_screen%20.dart';
import 'package:tailors_ui/screens/signup_screen.dart';
import 'package:tailors_ui/utils/ui_helper.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 51),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  "Sign in your account",
                  style: myTextStyle26(myFontWeight: FontWeight.w600,myFontFamily: poppinsFont),
                ),
                SizedBox(height: 24),
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
                    filled: true,
                      hintText:"password",
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
                SizedBox(height: 24),

                // Sign In Button
                roundedButton(btnName: "SIGN IN",btnCallBack: (){print("SIGN IN Button in Clicked");}),
                SizedBox(height: 12),
                // Forgot Password
                Center(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "forgot password?",
                      style: myTextStyle16(myFontFamily: poppinsFont,myColors: Color(0xff888888)),
                    ),
                  ),
                ),
                SizedBox(height: 12),
                // OR sign up with
                Center(
                  child: Text(
                    "or sign up with",
                    style: myTextStyle16(myFontFamily: poppinsFont,myColors: Color(0xff888888)),
                  ),
                ),
                SizedBox(height: 16),

                // Social Media Buttons
                Center(
                  child: Wrap(
                    children: [
                      buildSocialButton(imgPath: "assets/icons/auth_icons/google.png"),
                      SizedBox(width: 16),
                      buildSocialButton(imgPath: "assets/icons/auth_icons/fb.png"),
                    ],
                  ),
                ),

                SizedBox(height: 24),
                // Sign Up Link
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context)=>SignUpScreen() ));
                    },
                    child: RichText(
                      text: TextSpan(
                        text: "Don’t have an account? ",
                        style: myTextStyle16(myColors: Color(0xff888888),myFontFamily: poppinsFont),
                        children: [
                          TextSpan(
                            text: "SIGN UP",
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
        ),
      ),
    );
  }


}
