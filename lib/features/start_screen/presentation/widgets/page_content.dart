import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';

class PageContent extends StatelessWidget {

String image ;
String text ;
String text2 ;
PageContent({required this.image , required this.text , required this.text2});
  @override
  Widget build(BuildContext context) {
    return Column(      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 15.h,),
        Image.asset('assets/images/Logo.png'),
        Container(
          height: 250.h,
          width: 300.w,
          child: Image.asset(image)),
                  SizedBox(height: 10.h,),

        Center(
          child: Text(text ,
           textAlign: TextAlign.center, 
           style: TextStyle(
            fontSize: 22 , color: ColorManager.logo 
          ),),
        ),
        SizedBox(height: 10.h,),
        Center(
          child: Text(text2 ,
           textAlign: TextAlign.center, 
           style: TextStyle(
            fontSize: 16 , color: ColorManager.logo 
          ),),
        ),
      ],
    );
  }
}