import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/screens/splash.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_scaled_box.dart';
import 'package:url_strategy/url_strategy.dart';
import 'constants/routes.dart';
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  setPathUrlStrategy();
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      return MaterialApp.router(
      routerConfig: routerx,
     builder: (context, child) {
        return ResponsiveBreakpoints.builder(
            useShortestSide: false ,
            
            breakpoints: [
              const Breakpoint(start: 0, end: 450, name: MOBILE),
              const Breakpoint(start: 401, end: 1024, name: TABLET),
              const Breakpoint(start: 1025, end: 1920, name: DESKTOP),
              const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
            child: 
              Builder(builder: (context) {
                return ResponsiveScaledBox(
                  autoCalculateMediaQueryData: true,
                    width: ResponsiveValue<double>(context, conditionalValues: [
                      
                      Condition.smallerThan(breakpoint: 450, value: 500),
                    ]).value,
                  
                    child: child ?? Splash());
              }),
       
          );
     },
    );
  }
}