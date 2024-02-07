import 'dart:async';

import 'package:flutter/material.dart';
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  _initTime(){
    Timer(Duration(seconds: 2),(){

    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _initTime();
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
              child: Image.asset("assets/images/im_sample1.jpg",height: 100,width: 100,),
            ),
            Container(
              child: Column(
                children: [
                  Center(
                    child: Text('from Meta',style: TextStyle(color: Colors.black26,fontSize: 17),),
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
