// import 'dart:html';

import 'package:comento_pract/network/network_helper.dart';
import 'package:comento_pract/network/rest_api.dart';
import 'package:comento_pract/screen/list_screen.dart';
import 'package:comento_pract/screen/login_screen.dart';
import 'package:flutter/material.dart';

const String url = 'https://problem.comento.kr';

void main() async{
  await NetworkHelper().fetchGetCategory();

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        //이것 스택으로 바꿔야겠다.
        '/': (context) => LoginScreen(),
        '/listScreen': (context) => ListScreen(),
      },
    );
  }
}
