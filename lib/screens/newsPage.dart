import 'dart:ui';

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:apicalling/classes/trendy.dart';
import 'package:apicalling/utils/multi6.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../classes/categoricalNews.dart';
import '../provider/provider1.dart';
import '../utils/categories.dart';
import '../utils/multi3.dart';
import '../utils/multiText.dart';
import '../utils/newstab.dart';
import '../utils/shadowText.dart';
import '../utils/slider.dart';
import '../utils/trendyNews.dart';
import 'landingPage.dart';






class NewsPage extends StatelessWidget {
  String? Catname;
  String? img;
  String? name;
  NewsPage({super.key,required this.Catname,required this.img,required this.name});

  @override
  Widget build(BuildContext context) {
    final Provider11 = Provider.of<Provider1>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffD0D5F1),
        leading: GestureDetector(
          child: Icon(Icons.arrow_back,color: Color(0xff2F2D3A),),
          onTap: (){
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xff2F2D3A),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding:EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              children: [
                Container(
                  height: 200.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("$img"),fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(15.r)
                  ),
                  child: Container(
                            height: 120.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Color(0xff686799).withOpacity(0.6),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.0),
                              child: BackdropFilter(
                                filter:
                                    ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
                                child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      // color: Colors.transparent.withOpacity(0.2),
                                    ),
                                child: Center(child: ShadowText(color:Color(0xffD0D5F1) , shadowColor:Color(0xff2F2D3A) , subtitle: "$Catname", weight: FontWeight.bold, size: 30)),
                      ),
                   ),
                ),
                
              ),
                ),
                SizedBox(height: 10.h,),
                 Padding(
                    padding:EdgeInsets.symmetric(horizontal: 10.w),
                    child: FutureBuilder<List<News>>(
                       
                        future: Provider11.News1("$name"),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<News> newsList = snapshot.data!;
                            return SingleChildScrollView(
                    

                          child: Column(
                            children: newsList.map((news) {
                              
                              return Padding(
                                padding:EdgeInsets.only(right: 5.w,bottom: 5.h),
                                child: NewsTab1(title: news.title, desc: news.descr, img: news.imageUrl, catName: '',),
                              );
                            }).toList(),
                          ),
                        );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                  
                          // By default, show a loading spinner
                          return ShimmerEffect();
                        },
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