import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:flutter_app_testing/models/quiz.dart';
import 'package:flutter_app_testing/screens/customButton.dart';
import 'package:flutter_app_testing/screens/ProgressTimer.dart';
import 'package:flutter_app_testing/screens/QuestionCard.dart';

import '../models/quiz2.dart';



class Quiz2Screen extends StatelessWidget {
  const Quiz2Screen({Key? key}) : super(key: key);
  static const routeName = '/quiz2_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      // appBar: AppBar(
      //   elevation: 0,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/back2.jpg'),
                    fit: BoxFit.cover),
                color: Colors.black87),
          ),
          SafeArea(
            child: GetBuilder<QuizController2>(
              init: QuizController2(),
              builder: (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: 'Question ',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: Colors.white),
                              children: [
                                TextSpan(
                                    text: controller.numberOfQuestion
                                        .round()
                                        .toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4!
                                        .copyWith(color: Colors.white)),
                                TextSpan(
                                    text: '/',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white)),
                                TextSpan(
                                    text: controller.countOfQuestion.toString(),
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5!
                                        .copyWith(color: Colors.white)),
                              ]),
                        ),
                        ProgressTimer(),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 450,
                    child: PageView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => QuestionCard(
                        questionModel: controller.questionsList[index],
                      ),
                      controller: controller.pageController2,
                      itemCount: controller.questionsList.length,
                      // onPageChanged: controller.creer_partie(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  /*  Image.asset(
                    "assets/images/shf.png",
                    height: 250,
                  ),*/
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: GetBuilder<QuizController2>(
        init: QuizController2(),
        builder: (controller) => CustomButton(
          onPressed: () {
            controller.nextQuestion();
          },
          text: 'Next',
        ),
      ),
    );
  }
}
