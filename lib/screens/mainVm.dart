import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class MainVM extends ChangeNotifier {
  MainVM() {}
  String username = '';
  String password = '';
  refresh() {
    notifyListeners();
  }

  login() {
    if (username == 'admin' && password == 'admin') {
      Map<String,dynamic> userdata = {
        "username": username,
        "password": password
      };
      Hive.openBox('userdata');
      var box = Hive.box('userdata');
      box.put('userdata',userdata);
     
    }else{
      print('Invalid username or password');
    }
  }
  logout(){
    Hive.box('userdata').clear();
  }
  getHiveData(){
    var box = Hive.box('userdata');
     Map<String,dynamic> name = box.get('userdata');
      print(name);
  }
}
