import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/Result_screen2.dart';
import 'package:flutter_app_testing/screens/listeLevelsState.dart';
import 'package:get/get.dart';
import 'package:flutter_app_testing/models/question.dart';
import 'package:flutter_app_testing/screens/Result_screen.dart';
//import 'package:flutter_app_testing/screens/Welcome_screen.dart';

class QuizController extends GetxController{
  String name = '';
  //question variables
  int get countOfQuestion => _questionsList.length;
  final List<QuestionModel> _questionsList = [
    QuestionModel(
      id: 1,
      question:
      "ما هو أصل المرابطين ",
      answer: 1,
      options: ['عرب', 'أمازيغ', 'جزائريين'],
    ),
    QuestionModel(
      id: 2,
      question: "ما هي مدة حكم الدولة المرابطية",
      answer: 3,
      options: ['من 1147 حتى 1200', 'من 1115 حتى 1200', 'من 1012 حتى 1136', ' من 1056 حتى 1147'],
    ),
    QuestionModel(
      id: 3,
      question: "ما إسم المعركة التي إنتصر فيها  يوسف بن تاشفين على الإسبان",
      answer: 2,
      options: ['معركة العقاب', 'معركة الأرك', 'معركة الزلاقة'],
    ),
    QuestionModel(
      id: 4,
      question: "ما هي المدن التي كانت مقرا للإمبراطورية",
      answer: 2,
      options: ['الرباط ثم مراكش', 'فاس ثم مكناس', 'فاس ثم مراكش', 'مكناس ثم الرباط'],
    ),
    QuestionModel(
      id: 5,
      question:
      "ما هي القبيلة الأصل للمرابطين",
      answer: 0,
      options: ['قبيلة لمتونة', 'قبيلة زناتة', 'قبيلة نفزاوة'],
    ),
    QuestionModel(
      id: 6,
      question: "ما هي الدول التي حكمتها الإمبراطورية المرابطية",
      answer: 2,
      options: ['المغرب، تونس', 'المغرب، موريتانيا', 'المغرب، موريتانيا،الجزائر والأندلس', 'المغرب،غرب الجزائر'],
    ),
    QuestionModel(
      id: 7,
      question: "متى تم بناء مدينة مراكش",
      answer: 3,
      options: ['1060', '1070', '1072', '1062'],
    ),
    QuestionModel(
      id: 8,
      question: "أول حكماء الدولة المرابطية",
      answer: 2,
      options: ['علي بن يوسف', 'تاشفين بن علي', 'عبد الله بن ياسين', 'إبراهيم بن تاشفين'],
    ),
    QuestionModel(
      id: 9,
      question: "آخر حكماء الدولة المرابطية ",
      answer: 0,
      options: ['إسحق بن علي بن يوسف', 'يوسف بن تاشفين', 'عبد الله بن ياسين', 'علي بن يوسف'],
    ),
    QuestionModel(
      id: 10,
      question: "من الذين خلفوا المرابطين",
      answer: 2,
      options: ['السعديين', 'المرينيين', ' الموحدين'],
    ),
  ];
  /*List<QuestionModel> get questionsList{
    return questionsList;
  }
  List<QuestionModel> get questionsList2{
    return questionsList2;
  }
  set questionsList (List<QuestionModel> L){
    this.questionsList = L;
  }
  set questionsList2 (List<QuestionModel> L){
    this.questionsList2 = L;
  }*/
//List 2
  final List<QuestionModel> _questionsList2 = [
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
 // List<QuestionModel> get questionsList2 => [..._questionsList2];


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
  late PageController pageController;

  //timer
  Timer? _timer;


  final maxSec = 15;


  final RxInt _sec = 15.obs;


  RxInt get sec => _sec;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0);
    resetAnswer();
    resetAnswer2();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
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

    if (pageController.page == _questionsList.length - 1) {
      Get.offAndToNamed(ResultScreen.routeName);
      //enregistrement partie
    //  creer_partie(scoreResult);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      startTimer();
    }
    _numberOfQuestion = pageController.page! + 2;
    update();
  }
  void nextQuestion2() {
    if (_timer!.isActive) {
      stopTimer();
    }

    if (pageController.page == _questionsList2.length - 1) {
      Get.offAndToNamed(ResultScreen2.routeName);
      //enregistrement partie
      //  creer_partie(scoreResult);
    } else {
      _isPressed = false;
      pageController.nextPage(
          duration: const Duration(milliseconds: 500), curve: Curves.linear);

      startTimer();
    }
    _numberOfQuestion = pageController.page! + 2;
    update();
  }

  //called when start again quiz
  void resetAnswer() {
    for (var element in _questionsList) {
      _questionIsAnswerd.addAll({element.id: false});
    }
    update();
  }

  void resetAnswer2() {
    for (var element in _questionsList2) {
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

        final docPartie = FirebaseFirestore.instance.collection('Partie').doc('p1');
        final json ={
          'score': scoreResult,
          'email':"test@test.com"
        };
        await docPartie.set(json);
      }
      //2eme liste
  Future creer_partie2() async{

    final docPartie = FirebaseFirestore.instance.collection('Partie').doc('p2');
    final json ={
      'score': scoreResult,
      'email':"test1@test.com"
    };
    await docPartie.set(json);
  }

}
