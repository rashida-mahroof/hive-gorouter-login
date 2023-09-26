import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hive_test/screens/mainVm.dart';
import 'package:provider/provider.dart';
import 'package:auto_binding_field/auto_binding_field.dart';
class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: MultiProvider(
              providers: [
                 ChangeNotifierProvider(create: (context) => MainVM()),
              ],
              child: Consumer<MainVM>(
                builder: (context,mainVm,_) {
                  return Column(
                    children: [
                      Text('Login'),
                     AutoBindingTextField(value: mainVm.username,
                     onChanged: (value) {
                       mainVm.username = value;
                     },
                     ),
                     AutoBindingTextField(value: mainVm.password,
                     onChanged: (value) {
                       mainVm.password = value;
                     },
                     ),
                     ElevatedButton(onPressed: (){
                      mainVm.login();
                      context.goNamed('home');
                     }, child: Text('Login'))
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      ),
    );
  }
}