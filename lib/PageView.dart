import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'onboarding_cubit.dart'; // تأكد من استيراد الملف الصحيح

class PageViewCubitScreen extends StatelessWidget {
  PageViewCubitScreen({super.key});

  final _controller = PageController();



  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFF1F1), Color(0xFFE0F7FF)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: BlocBuilder<OnboardingCubit, int>(
                  builder: (context, currentPage) {
                    return PageView(
                      controller: _controller,
                      onPageChanged: (page) {
                        context.read<OnboardingCubit>().changePage(page);
                      },
                      children: const [
                        OnboardingPage(
                          image: 'assets/images/t.png',
                          title: '1 Y TAE',
                          description: 'تطبيق مخصص لتعليم الأطفال...',
                        ),
                        OnboardingPage(
                          image: 'assets/images/t2.png',
                          title: '2 Ÿ TAE',
                          description: 'تطبيق مخصص لتعليم الأطفال...',
                        ),
                        OnboardingPage(
                          image: 'assets/images/t3.png',
                          title: '3 Ÿ TAE',
                          description: 'تطبيق مخصص لتعليم الأطفال...',
                        ),
                      ],
                    );
                  },
                ),
              ),
              BlocBuilder<OnboardingCubit, int>(
                builder: (context, currentPage) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3,
                      (index) => _indicator(index == currentPage),
                    ),
                  );
                },
              ),
              SizedBox(height: 30.h),
              BlocBuilder<OnboardingCubit, int>(
                builder: (context, currentPage) {
                  return InkWell(
                    onTap: () {
                      if (currentPage < 2) {
                        _controller.nextPage(
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.ease,
                        );
                      } else {
                        print('Get Started!');
                      }
                    },
                    child: Container(
                      height: 60.h,
                      width: 60.w,
                      decoration: const BoxDecoration(
                        color: Color(0xffFF657F),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Icon(Icons.arrow_forward,
                            size: 24.sp, color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: 60.h)
            ],
          ),
        ),
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return Container(
      height: 5.h,
      width: 17.w,
      margin: EdgeInsets.symmetric(horizontal: 4.0.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black),
        color: isActive ? Colors.black : Colors.transparent,
      ),
    );
  }
}




class OnboardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;

  const OnboardingPage({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, height: 200.h), // Adjust height as needed
          SizedBox(height: 30.h),
          
          SizedBox(height: 10),
          Text(
            description,
            style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.bold,fontSize: 16.sp),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}