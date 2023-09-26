import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/screens/about.dart';
import 'package:hive_test/screens/contact.dart';
import 'package:hive_test/screens/home.dart';
import 'package:hive_test/screens/login.dart';
import 'package:hive_test/screens/mainVm.dart';
import 'package:provider/provider.dart';


class MyAppRouteConstants {
  static const String home = 'home';
  static const String login = 'login';
  static const String about = 'about';
  static const String profile = 'profile';
  static const String contactUs = 'contact';
}

final GoRouter routerx = GoRouter(
  initialLocation: "/",
  routes: _buildRoutes(),
  redirectLimit: 3,
  debugLogDiagnostics: true,
  restorationScopeId: 'sincav6',
  errorBuilder: (context, state) {
    return Scaffold(
      body: Center(
        child: Text('Page not found'),
      ),
    );
  },
);

List<RouteBase> _buildRoutes() {
 

  return [
    GoRoute(
      path: '/',
      builder: (context, state) {
        return FutureBuilder(
          future: Hive.openBox('userdata'),
          builder: (context, snapshot) {
             if (snapshot.connectionState == ConnectionState.done) {
              if(Hive.box('userdata').isEmpty){
                print(Hive.box('userdata'));
              return Login();
            }else{
              return HomeScreen();
            }
             }
             else{
              return Center(child: CircularProgressIndicator());
             }
          },
        );
      },
      routes: [
        ..._staticRoutes(),
       
      ],
    ),
  ];
}
fun(){}
List<GoRoute> _staticRoutes() {
  return [
    GoRoute(
      path: MyAppRouteConstants.home,
      name: MyAppRouteConstants.home,
      builder: (BuildContext context, GoRouterState state) =>
          MultiProvider(
            providers:[
              ChangeNotifierProvider<MainVM>(
              create: (context) => MainVM(),
            ),
            ],
            child: HomeScreen()),
    ),
    GoRoute(
      path: MyAppRouteConstants.login,
      name: MyAppRouteConstants.login,
      builder: (BuildContext context, GoRouterState state) =>
          const Login(),
    ),
    GoRoute(
      path: MyAppRouteConstants.about,
      name: MyAppRouteConstants.about,
      builder: (BuildContext context, GoRouterState state) =>
          const AboutScreen(),
    ),
    GoRoute(
      path: MyAppRouteConstants.contactUs,
      name: MyAppRouteConstants.contactUs,
      builder: (BuildContext context, GoRouterState state) =>
          const ContactScreen(),
    ),
   
    
  
  ];
}