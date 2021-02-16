
import 'package:comento_pract/const/size.dart';
import 'package:flutter/material.dart';
TextEditingController loginTitleController = new TextEditingController();
class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    if (size == null) {
      size = MediaQuery.of(context).size;
    }

    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('로그인화면'),
            TextField(
              controller: loginTitleController,
              textAlign: TextAlign.center,
              decoration: InputDecoration(
                  hintText: '텍스트를 넣어주세요',
                  hintStyle: TextStyle(color: Colors.grey,)
              ),
            ),
            FlatButton(
              child: Text('로그인하기'),
              color: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, '/listScreen');
              },
            )
          ],
        ),
      ),
    );
  }
}
