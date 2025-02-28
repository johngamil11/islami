import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:islami/features/azkar_screen/data/data_sources/local_data_source.dart';
import 'package:islami/features/azkar_screen/data/repositories_impl/azkar_repository_imp.dart';
import 'package:islami/features/azkar_screen/presentation/blocs/cubit/azkar_cubit.dart';
import 'package:islami/features/azkar_screen/presentation/pages/azkar_details_screen.dart';
import 'package:islami/features/azkar_screen/presentation/widgets/azkar_icon.dart';

class AzkarModel extends StatelessWidget {
String fileNameOne ;
String appBarNameOne ;
String titleNameOnePartOne ;
String titleNameOnePartTwo ;
String fileNameTwo ;
String appBarNameTwo ;
String titleNameTwoPartOne ;
String titleNameTwoPartTwo ;

AzkarModel({required this.fileNameOne , required this.appBarNameOne , required this.titleNameOnePartOne,
required this.titleNameOnePartTwo , required this.fileNameTwo , required this.appBarNameTwo,
required this.titleNameTwoPartOne , required this.titleNameTwoPartTwo ,
});
  @override
  Widget build(BuildContext context) {
    return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => AzkarCubit(
                                AzkarRepositoryImp(
                                    azkarLocalDataSource:
                                        AzkarLocalDataSource()),
                              )..loadAzkar(
                                  fileNameOne),
                              child: AzkarDetailsScreen(title: appBarNameOne),
                            ),
                          ),
                        );
                      },
                      child: AzkarIcon(
                        title: titleNameOnePartOne,
                        title2: titleNameOnePartTwo,
                      )),
                  SizedBox(
                    width: 3.w,
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) => AzkarCubit(
                                AzkarRepositoryImp(
                                    azkarLocalDataSource:
                                        AzkarLocalDataSource()),
                              )..loadAzkar(
                                  fileNameTwo),
                              child: AzkarDetailsScreen(title: appBarNameTwo),
                            ),
                          ),
                        );
                      },
                      child: AzkarIcon(
                        title: titleNameTwoPartOne,
                        title2:titleNameTwoPartTwo,
                      )),
                ],
              );
  }
}