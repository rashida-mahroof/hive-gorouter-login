import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_test/screens/mainVm.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          crossAxisAlignment:CrossAxisAlignment.center,
          children: [
            Text('Home'),
            ElevatedButton(onPressed: (){
              Provider.of<MainVM>(context,listen: false).logout();
              context.pushReplacement('/login');
            }, child: Text('Logout')),
            ElevatedButton(onPressed: (){
              context.goNamed('about');
            }, child: Text('about')),
            ElevatedButton(onPressed: (){
              context.goNamed('contact');
            }, child: Text('contact'))
          ],
        ),
      ),
    );
  }
}