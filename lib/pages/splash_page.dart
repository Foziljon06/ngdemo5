import 'dart:async';
import 'package:flutter/material.dart';
import 'package:ngdemo5/pages/signin_page.dart';
class SplashPage extends StatefulWidget {
  static const String id = "splash_page";

  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  callHomapage(){
    Navigator.pushReplacementNamed(context,SignInPage.id);
  }

  initTimer(){
    Timer(Duration(seconds: 5),(){
      callHomapage();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initTimer();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        padding: EdgeInsets.all(50),
        color: Colors.white,
        child: Stack(
          children: [
            Center(
              child: Image.asset(
                "assets/images/ins_logo.png",
                height: 100,
                width: 100,),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Center(
                    child: Text('from Meta',
                      style: TextStyle(color: Colors.black26,
                          fontSize: 17),),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
