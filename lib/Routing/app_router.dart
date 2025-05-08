import 'package:flutter/material.dart';
import 'package:pageviewusecubt/Routing/routes.dart';

import '../PageView.dart';
import '../on_pording_screen.dart';

class App_router {


  Route generatRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.on_Bording_page:
        return MaterialPageRoute(
            builder: (context) => const OnPordingScreen());
        case Routes.login_screen:
          return MaterialPageRoute(builder: (context) => const Placeholder());
        case Routes.PageView:
        return MaterialPageRoute(builder: (context)=>PageViewCubitScreen());  
      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child:
                  Text('Route not found!', style: TextStyle(color: Colors.red)),
            ),
          ),
        );
    }
  }
}
