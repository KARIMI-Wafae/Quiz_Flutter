import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_app_testing/screens/Result_screen2.dart';
import 'package:flutter_app_testing/screens/listeLevelsState.dart';
import 'package:get/get.dart';
import 'package:flutter_app_testing/models/question.dart';
import 'package:flutter_app_testing/screens/Result_screen.dart';
//import 'package:flutter_app_testing/screens/Welcome_screen.dart';

class QuizController2 extends GetxController{
  String name = '';
  //question variables
  int get countOfQuestion => _questionsList.length;
//List 2
  final List<QuestionModel> _questionsList = [
    QuestionModel(
      id: 1,
      question:
      "wafae ",
      answer: 2,
      options: ['karimi', 'alami', 'lamrani', 'sadani '],
    ),
    QuestionModel(
      id: 2,
      question: "Best State Mangment Ststem is ",
      answer: 1,
      options: ['karimi', 'alami', 'lamrani', 'sadani '],
    ),
    QuestionModel(
      id: 3,
      question: "amal",
      answer: 2,
      options: ['karimi', 'alami', 'lamrani', 'sadani '],
    ),
    QuestionModel(
      id: 4,
      question: "taha",
      answer: 1,
      options: ['karimi', 'alami', 'lamrani', 'sadani '],
    ),
    QuestionModel(
      id: 5,
      question:
      "nour",
      answer: 3,
      options: ['karimi', 'alami', 'lamrani', 'sadani '],
    ),
    QuestionModel(
      id: 6,
      question: "salma",
      answer: 2,
      options: ['karimi', 'alami', 'lamrani', 'sadani '],
    ),
    QuestionModel(
      id: 7,
      question: "ahmed",
      answer: 3,
      options: ['karimi', 'alami', 'lamrani', 'sadani '],
    ),
    QuestionModel(
      id: 8,
      question: "rajjaa",
      answer: 3,
      options: ['karimi', 'alami', 'lamrani', 'sadani '],
    ),
    QuestionModel(
      id: 9,
      question:
      "kamal ",
      answer: 2,
      options: ['karimi', 'alami', 'lamrani', 'sadani '],
    ),
    QuestionModel(
      id: 10,
      question: "lamiaa ",
      answer: 1,
      options: ['karimi', 'alami', 'lamrani', 'sadani '],
    ),
  ];
  /////////////////
  List<QuestionModel> get questionsList => [..._questionsList];


  bool _isPressed = false;


  bool get isPressed => _isPressed; //To check if the answer is pressed


  double _numberOfQuestion = 1;


  double get numberOfQuestion => _numberOfQuestion;


  int? _selectAnswer;


  int? get selectAnswer => _selectAnswer;


  int? _correctAnswer;


  int _countOfCorrectAnswers = 0;


  int get countOfCorrectAnswers => _countOfCorrectAnswers;

  //map for check if the question has been answered
  final Map<int, bool> _questionIsAnswerd = {};


  //page view controller
  late PageController pageController2;

  //timer
  Timer? _timer;


  final maxSec = 15;


  final RxInt _sec = 15.obs;


  RxInt get sec => _sec;

  @override
  void onInit() {
    pageController2 = PageController(initialPage: 0);
    resetAnswer();
    super.onInit();
  }

  @override
  void onClose() {
    pageController2.dispose();
    super.onClose();
  }

  //get final score
  double get scoreResult {
    return _countOfCorrectAnswers * 100 / _questionsList.length;
  }

  void checkAnswer(QuestionModel questionModel, int selectAnswer) {
    _isPressed = true;

    _selectAnswer = selectAnswer;
    _correctAnswer = questionModel.answer;

    if (_correctAnswer == _selectAnswer) {
      _countOfCorrectAnswers++;
    }
    stopTimer();
    _questionIsAnswerd.update(questionModel.id, (value) => true);
    Future.delayed(const Duration(milliseconds: 500)).then((value) => nextQuestion());
    update();
  }

  //check if the question has been answered
  bool checkIsQuestionAnswered(int quesId) {
    return _questionIsAnswerd.entries
        .firstWhere((element) => element.key == quesId)
        .value;
  }

  void nextQuestion() {
    if (_timer!.isActive) {
      stopTimer();
    }

    if (pageController2.page == _questionsList.length - 1) {
      Get.offAndToNamed(ResultScreen.routeName);
      //enregistrement partie
      //  creer_partie(scoreResult);
    } else {
      _isPressed = false;
      pageController2.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      startTimer();
    }
    _numberOfQuestion = pageController2.page! + 2;
    update();
  }

  //called when start again quiz
  void resetAnswer() {
    for (var element in _questionsList) {
      _questionIsAnswerd.addAll({element.id: false});
    }
    update();
  }


  //get right and wrong color
  Color getColor(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Colors.green.shade700;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Colors.red.shade700;
      }
    }
    return Colors.white;
  }

  //het right and wrong icon
  IconData getIcon(int answerIndex) {
    if (_isPressed) {
      if (answerIndex == _correctAnswer) {
        return Icons.done;
      } else if (answerIndex == _selectAnswer &&
          _correctAnswer != _selectAnswer) {
        return Icons.close;
      }
    }
    return Icons.close;
  }

  void startTimer() {
    resetTimer();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_sec.value > 0) {
        _sec.value--;
      } else {
        stopTimer();
        nextQuestion();
      }
    });
  }

  void resetTimer() => _sec.value = maxSec;

  void stopTimer() => _timer!.cancel();
  //call when start again quiz
  void startAgain() {
    _correctAnswer = null;
    _countOfCorrectAnswers = 0;
    resetAnswer();
    _selectAnswer = null;
    Get.offAllNamed(Levels.routeName);
  }

  Future creer_partie() async{

    final docPartie = FirebaseFirestore.instance.collection('Partie').doc('p2');
    final json ={
      'score': scoreResult,
      'email':"test1@test.com"
    };
    await docPartie.set(json);
  }


}
