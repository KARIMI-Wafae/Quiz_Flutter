
import 'package:get/get.dart';
import 'package:flutter_app_testing/models/quiz.dart';

class BilndingsApp implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => QuizController());
   // Get.lazyPut(() => QuizController2());
  }
}
