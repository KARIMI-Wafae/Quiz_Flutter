
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_testing/models/quiz.dart';
import 'package:flutter_app_testing/screens/Quiz_screen.dart';
import 'package:flutter/rendering.dart';
//import 'package:flutter_app_testing/screens/constantes.dart';
//import 'package:flutter_app_testing/screens/login.dart';

//import '../models/quiz2.dart';
//import 'Quiz2_Screen.dart';

class LevelDemarrer extends StatelessWidget {

  final _nameController = TextEditingController();

  final GlobalKey<FormState> _formkey = GlobalKey();
  late String value;

  void _submit(context) {
   // FocusScope.of(context).unfocus();
   // if (!_formkey.currentState!.validate()) return;
   // _formkey.currentState!.save();
     /* if(int.parse(value) > 5){
        QuizController Q= new QuizController();
        Q.questionsList= Q.questionsList2;
      }*/
      Get.offAndToNamed(QuizScreen.routeName);
      Get.find<QuizController>().startTimer();


  }

  @override
  void dispose() {
    _nameController.dispose();
   // super.dispose();
  }




  LevelDemarrer({required this.value});
 // LevelDemarrer(Map<String, String> map, {required this.value});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff89C2D9),
          title: Text('Level'+" "+value),
          centerTitle: true,
        ),
        resizeToAvoidBottomInset: false,
        extendBody: true,
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back_game.jpg'),
                fit: BoxFit.cover),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Spacer(
                      flex: 2,
                    ),
                  /*  Text(
                        'Let\'s start Quiz,',
                        style: TextStyle(color: KPrimaryColor)
                    ),*/
                    Center(
                        child: Image(
                          image: AssetImage('assets/images/logo_quiz.png'),
                          width: 180,
                          height: 180,
                          fit: BoxFit.fill,

                        )
                    )
                    ,
                    const Spacer(
                      flex: 1,
                    ),

                    const Spacer(
                      flex: 1,
                    ),
                    Container(
                      width: 400,
                      //padding: EdgeInsets.only(left: 40, right: 40),
                      //alignment: Alignment.center,
                      child: RaisedButton(
                        //  width: double.infinity,
                          onPressed: () => _submit(context),

                        child: Text("Start", style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,

                        ),
                        ),
                        padding: EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                        color: Color(0xffA22067),
                      textColor: Colors.white,),

                    ),
                    const Spacer(
                      flex: 2,
                    ),
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
}
