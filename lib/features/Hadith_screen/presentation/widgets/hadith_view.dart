import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';

class HadithView extends StatelessWidget {
  String title ; 
  String content ; 
HadithView({required this.title , required this.content});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450.h,
      width: 280.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: ColorManager.logo
      ),
      child: Stack(
        children: [
          Center(child: Opacity(
            opacity: 0.3,
            child: Image.asset('assets/images/HadithCardBackGround.png'))),
          Positioned(
            bottom: 0,
            child: Container(
              height: 60.h,
              clipBehavior: Clip.antiAlias,
              width: 280.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15.r) , bottomRight: Radius.circular(22.r))
              ),
              
              child: Image.asset('assets/images/Mosque-down.png' , fit: BoxFit.cover,))),
          Positioned(
            top: 5.h,
            right: 2.w,
            child: Image.asset('assets/images/Cornerr 1 hadeth.png')),
          Positioned(
            left: 2.w,
            top: 5,
            child: Image.asset('assets/images/Cornerr 2 hadeth.png')),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 5.h,),
            Container(
              margin: EdgeInsets.all(25),
              height: 400.h,
              width: 230.w.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                // color: ColorManager.primary,
              ),
              child:
              
              Column(
                children: [
                  Text(title , maxLines: 20,overflow:  TextOverflow.ellipsis, textAlign: TextAlign.center,style: TextStyle(
                    
                              fontSize: 22, 
                              fontFamily: 'QuranFont',
                              
                  ),),
                  SizedBox(height: 5.h,),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(content , maxLines: 20, softWrap: true,overflow:  TextOverflow.ellipsis, textAlign: TextAlign.center,style: TextStyle(
                                  fontSize: 18, 
                                  
                                  fontFamily: 'QuranFont',
                                  
                      ),),
                    ),
                  ),
                ],
              ) ,
              
            ),

          ],
        )
        ],
      ),
    );
  }
}