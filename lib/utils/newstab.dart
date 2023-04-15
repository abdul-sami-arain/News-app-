import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:apicalling/utils/multi2.dart';
import 'package:apicalling/utils/multi5.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../utils/multiText.dart';
import '../utils/shadowText.dart';
import '../utils/slider.dart';
import 'multi3.dart';
import 'multi6.dart';


class NewsTab1 extends StatelessWidget {
  String? catName;
  String? img;
  String? title;
  String? desc;
  NewsTab1({super.key,required this.img,required this.title,required this.desc,required this.catName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Color(0xffD0D5F1),width: 2),
        image: DecorationImage(image: NetworkImage("$img"),fit: BoxFit.cover)
      ),
      child: Container(
                            height: 120.h,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xff686799).withOpacity(0.6),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      // color: Colors.transparent.withOpacity(0.2),
                                    ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(children: [
                                    Multi5(color: Color(0xffD0D5F1), subtitle:"${title}", weight: FontWeight.bold, size: 18),
                                    SizedBox(height: 5.h,),
                                    Multi6(color: Color(0xffD0D5F1), subtitle:"${desc}...", weight: FontWeight.bold, size: 12)
                                  ]),
                                ),
                      ),
                   ),
                ),
                
              ),
    );
  }
}