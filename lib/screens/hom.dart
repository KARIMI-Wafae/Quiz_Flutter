
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/login.dart';
import 'package:flutter_app_testing/screens/profil.dart';
import 'package:flutter_app_testing/screens/home.dart';

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);
  static const routeName = '/hom';

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  static int currentIndex =0;
  final screens =[
    homePage(),
    profil(),
    loginScreen()
  ];
  @override
  Widget build(BuildContext context) {
    debugShowChechkedModeBanner: false;
    return Scaffold(


      body:Center(
        child: screens[currentIndex],
      )
      ,bottomNavigationBar: BottomNavigationBar(
      //Items animation
      selectedItemColor: Color(0xffA22067),
      selectedFontSize: 20,
      showUnselectedLabels: false,
      iconSize: 35,
      type: BottomNavigationBarType.fixed,

      currentIndex: currentIndex,
      onTap: (index) => setState(()=> currentIndex = index),
      backgroundColor: Color(0xff89C2D9),
      items: <BottomNavigationBarItem> [
        BottomNavigationBarItem(
          icon: Icon(Icons.home,color: Color(0xffF28DB2),),
          label: 'Home',

        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: Color(0xffF28DB2),),
            label: 'Profil'),


        BottomNavigationBarItem(
            icon: Icon(Icons.logout,color: Color(0xffF28DB2),),
            label: 'Logout'),



      ],
    ),
    );
  }
}
