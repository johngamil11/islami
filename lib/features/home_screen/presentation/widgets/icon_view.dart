import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';

class IconView extends StatelessWidget {
  String text ; 
  String image ;
IconView({required this.text , required this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.h,
      width: 100.w,
      decoration: BoxDecoration(
      color: const Color.fromARGB(82, 0, 0, 0),
      border: Border.all(
        color: ColorManager.primary,
        width: 4 ,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child:  Column(
       mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 100.h,
            width: double.infinity,
           
            child: Image.asset(image , fit: BoxFit.contain,)),
           Expanded(
             child: Container(
              width: double.infinity,
              
              margin: EdgeInsets.all(5),
              child: Text(text ,
              textAlign: TextAlign.center, 
              style: TextStyle(fontSize: 25 ,decoration: TextDecoration.none, color: ColorManager.white),)),
           )
        ],
      ),
   
    );
  }
}