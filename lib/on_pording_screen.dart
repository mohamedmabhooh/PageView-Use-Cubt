import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pageviewusecubt/helpers/extensions.dart';

import 'Routing/routes.dart';


class OnPordingScreen extends StatefulWidget {
  const OnPordingScreen({super.key});

  @override
  State<OnPordingScreen> createState() => _OnPordingScreenState();
}

class _OnPordingScreenState extends State<OnPordingScreen> {
    @override
  void initState() {
    super.initState();
    // تأخير 3 ثوانٍ ثم الانتقال للشاشة التالية
    Future.delayed(Duration(seconds: 3), () {
      print('test');
     context.pushNamed(Routes.PageView);
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFF1F1), Color(0xFFE0F7FF)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // تأكد من إضافة الصورة في مجلد assets
              Image.asset(
                'assets/images/afaq_logo.png',
                width: 250.w,
                height: 250.h,
              ),
             
              
            ],
          ),
        ),
      ),
    );
 
  }
}