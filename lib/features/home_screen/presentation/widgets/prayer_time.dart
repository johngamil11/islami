import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/core/utils/color_manager.dart';
import 'package:islami/features/home_screen/presentation/widgets/prayer_icon.dart';

class PrayerTime extends StatelessWidget {
  const PrayerTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(width: 320.w,
                  height: 280.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: ColorManager.primary,
                      width: 4,
                    )
                        
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 150.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                   border: Border.all(color: ColorManager.primary,),
                                  ),
                                  child: Stack(
                                    alignment:Alignment.center ,
                                    children:
                                  
                                [ Image.asset('assets/images/circle.png'),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('المغرب' , style: TextStyle(color: ColorManager.white ,decoration: TextDecoration.none, fontSize: 18 , ),),
                                  Text('بعد' , style: TextStyle(color: ColorManager.white ,decoration: TextDecoration.none, fontSize: 18 , ),),
                                  Text('04:15:07' , style: TextStyle(color: ColorManager.white ,decoration: TextDecoration.none, fontSize: 18 , ),),

                                    ],
                                  )
                                ]),
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 50.h,
                                  width: 130.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                   border: Border.all(color: ColorManager.primary,),
                                  ),
                                  child: Text('التاريخ' , style: TextStyle(color: ColorManager.white , decoration: TextDecoration.none,fontSize: 14 ),),
                                ),
                                SizedBox(height: 3.h,),
                                Container(
                                  height: 50.h,
                                  width: 130.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                   border: Border.all(color: ColorManager.primary,)
                                  ),
                                child: Text('الشروق' , style: TextStyle(color: ColorManager.white , decoration: TextDecoration.none,fontSize: 14 ),),
                                ),
                                SizedBox(height: 3.h,),
                                // Container(
                                //   height: 50.h,
                                //   width: 130.w,
                                //   decoration: BoxDecoration(
                                //     borderRadius: BorderRadius.circular(15),
                                //    border: Border.all(color: ColorManager.primary,)
                                //   ),
                                // ),
                                SizedBox(height: 2.h,),
                                
                              ],
                            )
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          PrayerIcon(),
                          PrayerIcon(),
                          PrayerIcon(),
                          PrayerIcon(),
                          PrayerIcon(),
                        ],
                      )
                      // Expanded(
                      //   child: GridView.builder(
                      //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,
                      //     childAspectRatio: 9/5,
                      //     crossAxisSpacing: 5 ,
                      //     mainAxisSpacing: 5),
                      //     itemCount: 5,
                      //     scrollDirection: Axis.horizontal,
                      //      itemBuilder: (context , index){
                      //      return Container(
                      //          height: 120.h,
                      //           width: 80.w,
                      //           decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.circular(15),
                      //                border: Border.all(color: ColorManager.primary,)
                      //               ),
                      //       );
                      //      }),
                      // ),

                      // Container(
                      //        height: 120.h,
                      //         width: 80.w,
                      //         decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(15),
                      //              border: Border.all(color: ColorManager.primary,)
                      //             ),
                      //     ),
                        

                    ],
                  ),
                  ); // todo: mawaqit el sala;
  }
}