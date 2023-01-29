import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/Quiz2_Screen.dart';
import 'package:flutter_app_testing/screens/hom.dart';
import 'package:flutter_app_testing/screens/listeLevelsState.dart';
import 'package:flutter_app_testing/screens/login.dart';
import 'package:flutter_app_testing/screens/sinscrire.dart';
import 'package:get/get.dart';
import 'package:flutter_app_testing/screens/Quiz_screen.dart';
import 'package:flutter_app_testing/screens/Result_screen.dart';
import 'package:flutter_app_testing/screens/Welcome_screen.dart';
import 'package:flutter_app_testing/models/binding.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_testing/models/authentication.dart';
import 'package:firebase_core/firebase_core.dart';


 Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Authentification(),
        )
      ],
     child : GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BilndingsApp(),
      title: 'Flutter Quiz App',
      home:   loginScreen(), //WelcomeScreen(),
      getPages: [
        GetPage(name: WelcomeScreen.routeName, page: () => WelcomeScreen()),
        GetPage(name: QuizScreen.routeName, page: () =>  QuizScreen()),
        GetPage(name: ResultScreen.routeName, page: () =>  ResultScreen()),
        GetPage(name: Levels.routeName, page: () => Levels()),
        GetPage(name: loginScreen.routeName, page: ()=> loginScreen()),
        GetPage(name: signupScreen.routeName, page: ()=> signupScreen()),
        GetPage(name: home.routeName, page: ()=> home()),
        GetPage(name: Quiz2Screen.routeName, page: ()=>Quiz2Screen()),
      ],
    ),
    );
  }
}
