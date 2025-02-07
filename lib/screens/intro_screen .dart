import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:tailors_ui/screens/sign_in_screen.dart';
import 'package:tailors_ui/utils/ui_helper.dart';

import '../utils/app_const.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();
  final pageIndexNotifier = ValueNotifier<int>(0); // Tracks current page index

  @override
  void dispose() {
    pageIndexNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder<int>(
                  valueListenable: pageIndexNotifier,
                  builder: (context, value, child) {
                    return Text(
                      "${value + 1}/3", // Dynamic page counting
                      style: myTextStyle18(myFontFamily: montserratFont,myFontWeight: FontWeight.w600),
                    );
                  },
                ),
                  GestureDetector(
                    onTap: () {
                      introKey.currentState?.skipToEnd();
                      setState(() {});
                    },
                    child: Text(
                      "Skip",
                      style: myTextStyle18(myFontFamily: montserratFont,myFontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: IntroductionScreen(
              controlsPadding: EdgeInsets.symmetric(vertical: 25),
              key: introKey,
              pages: AppConst.introDetails.map((eachIntro){
                return PageViewModel(
                    title: "",
                  bodyWidget:  Column(
                    children: [
                      Container(
                        width: 300,
                        height: 300,
                        //color: Colors.deepPurple,
                        child: Image(
                            image: AssetImage(eachIntro['introImg'])),
                      ),
                      SizedBox(height: 22,),
                      Text(eachIntro['title'],style: myTextStyle28(myColors: primaryColor,myFontWeight: FontWeight.bold,myFontFamily:interFont),),
                      SizedBox(height: 19,),
                      Text(eachIntro['description'],textAlign: TextAlign.center,style: myTextStyle15(myFontFamily: interFont,myFontWeight: FontWeight.w400),),
                    ],
                  )
                );
              }).toList(),
              onDone: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SignInScreen(),));
              },
              //skip: SizedBox.shrink(),
              showBackButton: true,
              back: Text("Prev",style: myTextStyle18(myFontFamily: montserratFont,myColors: Color(0xffC4C4C4),myFontWeight: FontWeight.w600),),// Hide default skip button
              next:Text("Next",style: myTextStyle18(myFontFamily: montserratFont,myColors: primaryColor,myFontWeight: FontWeight.w600),),
              done: Text("Get Started", style: myTextStyle18(myFontFamily: montserratFont,myColors: primaryColor,myFontWeight: FontWeight.w600)),
              
              dotsDecorator: DotsDecorator(
                size: Size(10, 10),
                color: Color(0xffC4C4C4),
                activeSize: Size(40, 08),
                activeColor: primaryColor,
                activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              ),
              onChange: (index) {
                pageIndexNotifier.value = index; // Update page index
              },
            ),
          ),
        ],
      ),
    );
  }

}


