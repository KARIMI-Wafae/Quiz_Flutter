import 'package:flutter/material.dart';
//import 'package:get/get.dart';
//import 'package:flutter_spinkit/flutter_spinkit.dart';
class chargement extends StatefulWidget {
  const chargement({Key? key}) : super(key: key);

  @override
  State<chargement> createState() => _chargementState();
}

class _chargementState extends State<chargement> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 100),
        child: Column(
          children: [
            Image.asset('assets/images/logo_quiz.png',height: 200,width: 200,),
            SizedBox(
              height: 10,
            ),
          //  SpinkitChasingDots(
           //   color: Color(0xffA22067),
           //   size:50
           // )
          ],
        ),
      ),
    );
  }
}

