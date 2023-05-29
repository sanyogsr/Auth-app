import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';
class LoginRegisterPage extends StatefulWidget {
  const LoginRegisterPage({ Key? key }) : super(key: key);

  @override
  _LoginRegisterPageState createState() => _LoginRegisterPageState();
}

class _LoginRegisterPageState extends State<LoginRegisterPage> {

  String errormessage = '';
  bool isLogin = true;

  final TextEditingController _controlleremail  = TextEditingController();
  final TextEditingController _controllerpassword  = TextEditingController();

  Future<void> signInWithEmailAndPassword() async
  {
    try{
await Auth().signInWithEmailAndPassword(
  email: _controlleremail.text
, password: _controllerpassword.text);
    
    }  on FirebaseAuthException catch(e){
      setState(() {
        errormessage  = e.message!;
      });

    }
  }


  Future<void> createUserWithEmailAndPassword() async{
    try{
await Auth().createUserWithEmailAndPassword(email: _controlleremail.text
, password: _controllerpassword.text );

    }on FirebaseAuthException catch (e){

setState(() {
  errormessage = e.message!;
});
    }
  }

 Widget _title(){
  return const Text('Firebase Auth');

 }
 

 Widget _entryField(
String title,

TextEditingController controller){
  return TextField(
    controller: controller,

    decoration: InputDecoration(labelText: title ),
  );
}
 
   Widget _errormessage(){
    return Text(errormessage == ''?'': 'humm $errormessage');
   }

   Widget _submitButton(){
    return  ElevatedButton(onPressed: isLogin? signInWithEmailAndPassword: createUserWithEmailAndPassword
    , child: Text(isLogin? 'Login': 'Register'));
   }
   Widget _loginOrRegisterButton(){
    return TextButton(onPressed:  (){ setState(() {
      isLogin = !isLogin;
    });},
    child: 
    Text(isLogin? 'Register Instead': 'Login Instead'),
     );
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:_title() ,
      ),
      body: Container(
        height: double.infinity,

        width: double.infinity,
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _entryField('email', _controlleremail),
            _entryField('password', _controllerpassword),
            _errormessage(),
            _submitButton(),
            _loginOrRegisterButton()

          ]),
      ),

    );
  }

}
