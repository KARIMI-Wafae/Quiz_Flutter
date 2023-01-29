import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/listeLevelsState.dart';


class homePage extends StatelessWidget {
  const homePage({Key? key}) : super(key: key);
  static const routeName = '/home';


  @override
  Widget build(BuildContext context) {
    debugShowChechkedModeBanner: false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff89C2D9),
        title: Text('Bienvunue dans Culture Quiz'),
        centerTitle: true,

      ),

      body: Stack(
        children: <Widget> [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/back_game.jpg'),
                  fit: BoxFit.cover),
            ),
            child:  Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Center(

              ),
                Container(
                  height: 200,

                  margin: EdgeInsets.all(10),
                  alignment: Alignment.center,
                  child: Image(image: AssetImage('assets/images/logo_quiz.png'),
                    width: 160,
                    height: 160,
                    fit: BoxFit.fill,

                  ),
                ),
                SizedBox(
                  height: 40,
                ),
                Container(
                  padding: EdgeInsets.only(left: 40, right: 40),
                  child:RaisedButton(onPressed: (){
                    Navigator.of(context).pushReplacementNamed(Levels.routeName);
                    },
                    padding: EdgeInsets.all(20),
                    color: Color(0xffA22067),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    child: Text("Jouer", style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,


                    ),
                    ),

                  ) ,
                )
              ],
            ),
          ),
        ],
      )
     /* ,bottomNavigationBar: BottomNavigationBar(

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
    )*/,
    );
  }
}
