import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'sinscrire.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_testing/models/authentication.dart';
//import 'home.dart';
import 'hom.dart';

class loginScreen extends StatefulWidget {
 // const loginScreen({Key? key}) : super(key: key);
  static const routeName = '/login';
   String? email;

  @override
  State<loginScreen> createState() => _loginScreenState();

}

class _loginScreenState extends State<loginScreen> {
  final GlobalKey<FormState> _formcle = GlobalKey();
  Map<String,String> _authData = {
    'email': '',
    'password': ''
  };
  String getEmail(){
    return _authData['email'].toString();
  }
  String getPass(){
    return _authData['password'].toString();
  }
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
  Future<void> _seConnecter() async{
      if(!_formcle.currentState!.validate()){
        return;
      }
      _formcle.currentState!.save();
      try{
        await  Provider.of<Authentification>(context, listen: false).logIn(
            _authData ['email']!,
            _authData ['password']!
        );
        Navigator.of(context).pushReplacementNamed(home.routeName);
      }catch(error){
        var errormessage = 'Authentification echoué. Réssayer plutart!';
        _afficherErrorMessage(errormessage);
      }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff89C2D9),
        title: Text('Login'),



        actions: <Widget>[
          FlatButton(

            child: Row(
              children: <Widget>[
                Text('sign up '),
                Icon(Icons.person_add)
              ],
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.of(context).pushReplacementNamed(signupScreen.routeName);
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
                 height: 250,

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
              color: Color(0xffF2EADF),

              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 260,
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
                          {//*********************************
                            if(value != null){
                              if(value.isEmpty || !value.contains('@')){
                                return 'invalid Email';
                              }
                            }

                                return null;
                          },
                          onSaved: (value){
                            //***********************************
                            if(value != null){
                              _authData['email'] = value;
                            }

                          },
                        ),
                        //Password
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Password'),
                          obscureText: true,
                          validator: (value){
                            //******************* value!
                            if(value != null){
                              if(value.isEmpty || value.length<=5){
                                return 'invalid Password';
                              }
                            }
                            return null;
                          },
                          onSaved: (value){
                            //*************** !value
                            if(value != null){
                              _authData['password'] = value;
                            }
                          },
                        ),
                        SizedBox(height: 45),
                        RaisedButton(
                          child: Text("Se connecter" ,style: TextStyle(
                           // fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),),
                          onPressed: (){
                            _seConnecter();
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

