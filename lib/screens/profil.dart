
import 'package:flutter/material.dart';


class profil extends StatelessWidget {
  const profil({Key? key}) : super(key: key);
  static const routeName = '/profil';
  @override
  Widget build(BuildContext context) {
    debugShowChechkedModeBanner: false;
  // TODO: implement build
  return MaterialApp(
  home: Scaffold(
  appBar: AppBar(
    backgroundColor: Color(0xff89C2D9),
    title: Text('Bienvunue dans votre profil'),
    centerTitle: true,
  ),
  backgroundColor: Colors.white,
  body: SafeArea(

  child: Center(
  child: Column(
  mainAxisAlignment: MainAxisAlignment.center,
  children: <Widget>[
  CircleAvatar(
  radius: 80,
  backgroundImage: AssetImage('assets/images/logo_quiz.png'),
  ),
  /*Text(
  'Proto Coders Point',
  style: TextStyle(
  fontFamily: 'SourceSansPro',
  fontSize: 25,
  ),
  ),*/
  Text(
  'Bienvenue',
  style: TextStyle(
  fontSize: 20,
  fontFamily: 'SourceSansPro',
  color: Color(0xffD96690),
  letterSpacing: 2.5,
  ),
  ),
  SizedBox(
  height: 20.0,
  width: 200,
  child: Divider(
  color: Colors.teal[100],
  ),
  ),
  Text("Détails"),
  Card(
  color: Colors.white,
  margin:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
  child: ListTile(
  leading: Icon(
  Icons.email,
  color: Colors.teal[900],
  ),
  title: Text(
  'test@test.com',
  style:
  TextStyle(fontFamily: 'BalooBhai', fontSize: 20.0),
  ),
  )),
  Card(

  color: Colors.white,
  margin:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
  child: ListTile(

    title: Text('Level 1'),
    leading: CircleAvatar(
      child: Text("1"),
      backgroundColor: Color(0xffD96690),
    ),
    trailing: Text("60/100"),
    subtitle: Text("المرابطين"),
  ),
  )
  ],
  ),
  ),
  ),
  ),
  );
  }
}
