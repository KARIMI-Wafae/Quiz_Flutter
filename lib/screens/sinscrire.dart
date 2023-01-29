import 'package:flutter/material.dart';
import 'package:flutter_app_testing/screens/home.dart';
import 'package:flutter_app_testing/screens/login.dart';
import 'login.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_testing/models/authentication.dart';
import 'home.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({Key? key}) : super(key: key);
  static const routeName = '/signup';

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final GlobalKey<FormState> _formcle = GlobalKey();
  TextEditingController _passwordController = new TextEditingController();
  Map<String,String> _authData ={
    'email': '',
    'password':''
};
  void _afficherErrorMessage(String message){
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Erreur'),
          content: Text(message),
          actions: <Widget> [
            FlatButton(
                onPressed: (){
                  Navigator.of(ctx).pop();
                },
                child: Text('OK'))
          ],
        )
    );
  }
  void _afficherOKMessage(String message){
    showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text('Succès'),
          content: Text(message),
          actions: <Widget> [
            FlatButton(
                onPressed: (){
                  Navigator.of(ctx).pop();
                },
                child: Text('OK'))
          ],
        )
    );
  }
  Future<void> _sinscrire() async{
  if(!_formcle.currentState!.validate()){
        return;
  }
  _formcle.currentState?.save();
  try{
    await Provider.of<Authentification>(context,listen : false).signUp(
        _authData!['email']!,
        _authData!['password']!
    );
    //Afficher message de reusite
    var OKmessage = 'Inscription Réussie. Connecter vous!';
    _afficherOKMessage(OKmessage);
    Navigator.of(context).pushReplacementNamed(homePage.routeName);
  }catch(error){
    var errormessage = 'Inscription echoué. Réssayer plutart!';
    _afficherErrorMessage(errormessage);
  }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff89C2D9),
        title: Text('Inscription'),
        actions: <Widget>[
          FlatButton(
            child: Row(
              children: <Widget>[
                Text('Login '),
                Icon(Icons.person)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(loginScreen.routeName);
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget> [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors:
                [Color(0xffF2C9E0),
                  Color(0xff89C2D9)])
            ),
          ),
          Container(
            height: 160,

            margin: EdgeInsets.all(10),
            alignment: Alignment.center,
            child: Image(image: AssetImage('assets/images/logo_quiz.png'),
              width: 140,
              height: 140,
              fit: BoxFit.fill,

            ),
          ),

          Center(

            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 340,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formcle,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget> [
                        //Email
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value)
                          {
                            if(value!.isEmpty || !value!.contains('@')){
                              return 'invalid Email';
                            }
                            return null;
                          },
                          onSaved: (value){
                              _authData['email'] = value!;
                          },
                        ),
                        SizedBox(height: 20),
                        //Password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value){
                            if(value!.isEmpty || value!.length<=5){
                              return 'invalid Password';
                            }
                            return null;
                          },
                          onSaved: (value){
                              _authData['password'] = value!;
                          },
                        ),
                        SizedBox(height: 20),
                        //Confirm Password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Confirmer votre Password'),
                          obscureText: true,
                          validator: (value){
                            if(value!.isEmpty || value != _passwordController.text){
                              return 'invalid Password';
                            }
                            return null;
                          },
                          onSaved: (value){

                          },
                        ),
                        SizedBox(height: 45),
                        RaisedButton(
                          child: Text("S'inscrire'" ,style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),),
                          onPressed: (){
                            _sinscrire();
                          },
                          padding: EdgeInsets.all(15),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          color: Color(0xffA22067),
                          textColor: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

