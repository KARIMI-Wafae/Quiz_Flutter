import 'package:flutter/material.dart';
//import 'package:flutter_app_testing/screens/listeLevelsState.dart';
import 'package:get/get.dart';
import 'package:flutter_app_testing/screens/constantes.dart';
import 'package:flutter_app_testing/models/quiz.dart';
import 'package:flutter_app_testing/screens/customButton.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({Key? key}) : super(key: key);
  static const routeName = '/result_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back_result2.jpg'),
                    fit: BoxFit.cover),
              ),
            ),
            Center(
              child: GetBuilder<QuizController>(
                init: Get.find<QuizController>(),
                builder: (controller) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Jeu términé',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      controller.name,
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: KPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Ton Score est',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      '${controller.scoreResult.round()} /100',
                      style: Theme.of(context).textTheme.headline3!.copyWith(
                        color: KPrimaryColor,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    CustomButton(

                       // onPressed: () => controller.startAgain(),
                      onPressed: ()=>  controller.creer_partie(),

                        text: 'Save'),
                    const SizedBox(
                      height: 30,
                    ),
                   CustomButton(

                       onPressed: () => controller.startAgain(),
                     //   onPressed: ()=>  Navigator.of(context).push(MaterialPageRoute(
                      //    builder: (context) => Levels(),)),
                        text: 'Rejouer'),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
