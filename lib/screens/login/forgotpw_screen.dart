import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flushbar/flushbar.dart';

import 'package:flutter/services.dart';
import 'package:craftrip_app/services/resetpw.dart';


class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  
  final usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Color(0xff2675eb),
        elevation: 0.0,
      ),

      backgroundColor: Color(0xff2675eb),
      
      body: Center(
        child: SingleChildScrollView(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children:[
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.08,
                      width: MediaQuery.of(context).size.width * 0.18, 
                      child: Image.asset('assets/TravelDiaryIcon.png'),
                    ),

                    Text('CrafTrip',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.w700,
                        color: Colors.white
                      ),
                      textAlign: TextAlign.center,)
                  ]
                )
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Text('FORGOT PASSWORD',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.white
                  ),
                  textAlign: TextAlign.center,)),

              SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 0.0),
                
                child: Container(
                  width: 300.0,
                  
                  child: TextFormField(
                    maxLines: 1,
                    keyboardType: TextInputType.text,
                    autofocus: false,
                    
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)
                        ),
                        hintText: 'Email ID',
                        prefixIcon: Icon(
                            Icons.email,
                            color: Colors.white
                        ),
                        hintStyle: TextStyle(
                            color: Colors.white
                        )
                    ),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    controller: usernameController,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 50.0, 0.0, 50.0),
                
                child: Container(
                  width: 300.0,
                  height: 50.0,
                  
                  child: RaisedButton(
                    
                    onPressed: () async {
                      String username = usernameController.text;

                      var sessToken = await ResetModel().handleForgotPw(username);

                      if(sessToken){
                        showCorrectInfoFlushbar(context);}
                      else{
                        showIncorrectInfoFlushbar(context);
                      }
                    },

                    child: Text(
                      'Send Recovery Email',
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff2675eb)
                      ),
                      textAlign: TextAlign.center,
                    ),
                    color: Colors.white,
                  ),
                )
              ),
            ]
          )
        )
      )
    );
  }

  void showIncorrectInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Wrong Credentials!',
      message: 'Please try again.',
      icon: Icon(
        Icons.info_outline,
        size: 28,
        color: Color(0xff2675eb),
      ),
      leftBarIndicatorColor: Color(0xff2675eb),
      duration: Duration(seconds: 3),
    )..show(context);
  }

  void showCorrectInfoFlushbar(BuildContext context) {
    Flushbar(
      title: 'Reset Link',
      message: 'The password reset link will be sent to you registered e-mail ID.',
      icon: Icon(
        Icons.send,
        size: 28,
        color: Color(0xff2675eb),
      ),
      duration: Duration(seconds: 3),
      leftBarIndicatorColor: Color(0xff2675eb),
    )..show(context);
  }
}