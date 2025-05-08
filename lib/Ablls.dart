import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Routing/app_router.dart';
import 'Routing/routes.dart';

class Ablls extends StatelessWidget {
  final App_router app_router;

  const Ablls({super.key, required this.app_router});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        child: MaterialApp(
          title: "Aplls",
          theme: ThemeData(
       //     primaryColor: ColorMnger.mine_blue,
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: Routes.on_Bording_page,
          onGenerateRoute: app_router.generatRoute,
          
        ));
  }
}
