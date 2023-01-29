
import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/LevelDemarrer.dart';
//import 'package:flutter_app_testing/screens/Welcome_screen.dart';
//import 'package:flutter_app_testing/screens/login.dart';
//import 'package:flutter_app_testing/screens/profil.dart';
//import 'package:flutter_app_testing/screens/sinscrire.dart';
//import 'package:flutter_app_testing/screens/LevelDemarrer.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'learninf',
      theme: ThemeData(
        primarySwatch: Colors.teal,

      ),
      home: Levels(),
    );
  }
}

class Levels extends StatefulWidget {
  const Levels({Key? key}) : super(key: key);
  static const routeName = '/levelsStat';



  @override
  State<Levels> createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  int _selectedIndex = -1;
  late String value;
  Map<int, String> someMap = {
    0: "المرابطين",
    1: "الموحدين",
    2: "المرينيين",
    3: "السعديين",
    4:"الأدارسة"
  };
  void _allerLevel(){


  }
  @override
  Widget build(BuildContext context) {
    debugShowCheckedModeBanner: false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff89C2D9),
        title: Text('Levels'),
        centerTitle: true,
      ),
      
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return AnimatedContainer(
              duration: Duration(milliseconds: 300),
              height: 65,
              color: _selectedIndex == index ? Color(0xffF2C9E0) : Colors.transparent,
              child: ListTile(

                title: Text('Level'+" "+(index+1).toString()),
                  leading: CircleAvatar(
                    child: Text((index+1).toString()),
                    backgroundColor: Color(0xffD96690),
                  ),
                  trailing: Icon(Icons.play_arrow ),
                  subtitle: Text(someMap[index].toString()),
                onTap: ()  {
                  _selectedIndex = index;
                  value = (_selectedIndex+1).toString();
                //  _allerLevel();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => LevelDemarrer(value: value),));
                }
                ),
              );

          }
      ),
    );
  }

}
