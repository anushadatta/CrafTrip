import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../../services/collections.dart';
import 'package:craftrip_app/screens/main_screen.dart';
import 'package:craftrip_app/screens/travelPicks/swipes_tutorial.dart';


class UserPreference extends StatefulWidget {
  @override
  _UserPreferenceState createState() => _UserPreferenceState();
}

class _UserPreferenceState extends State<UserPreference> {
  
  List<int> defaultCheck = [0,0,0,0,0,0,0,0,0];
  String s;

  void updateState(int index) 
  {
    if (defaultCheck[index] == 1)
    {
      defaultCheck[index] -= 1;
    }
    else
    {
      for(int i = 0; i < defaultCheck.length; i++)
      {
        defaultCheck[i] = 0;
      }

      defaultCheck[index] = 1;
    }
  }

  // Check default
  bool stateDefault() 
  {
    for(int i = 0; i < defaultCheck.length; i++)
      {
        if (defaultCheck[i] != 0)
        {
          return false;
        }
      
      }
      return true;
  }

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      title: 'Flutter Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        
        appBar: PreferredSize( 
          preferredSize: Size.fromHeight(65.0),
          
          child: AppBar(
            backgroundColor: Color(0xff2675eb),
            title: Center(
              
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                
                children: <Widget>[
                    Text('PREFERENCE',
                        style: TextStyle(
                          fontSize: 24.0,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w400
                      )
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      
                      children: <Widget>[
                        SizedBox(
                          height: 20.0,
                          width: 30.0,
                          child: Image.asset('assets/TravelDiaryIcon.png'),
                        ),

                        Text('CrafTrip',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white
                          )
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: 
                  Text("Hi there, welcome to CrafTrip! Let's get started - please pick your top travel tag",
                    style: TextStyle(
                      fontSize: 20.0,
                      letterSpacing: 0.5,
                      color: Colors.black,
                        ),
                      textAlign: TextAlign.center,
                      ),
                  ),

                  // Row 1 of user tag preferences
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: <Widget>[
                       // Historical Architecture 
                       SizedBox(
                        width: 125.0,
                        height: 48.0,
                        child:
                        FlatButton(
                          onPressed: () {
                            setState(()
                            {
                              updateState(0);
                            });
                            defaultCheck[0] == 0 ? Text(" ") : s = 'Bucket_Historical_Architecture';
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: 
                            Text('Historical \nArchitecture', 
                              style:TextStyle(fontSize: 14.0), 
                              textAlign: TextAlign.center
                            ),
                          ),
                          color: defaultCheck[0] == 0 ? Colors.white : Colors.grey[350],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))
                        ),
                      ),

                      // Mountainous Landscape 
                      SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                        FlatButton(
                          onPressed: () {
                            setState(()
                            {
                              updateState(1);
                            });
                            defaultCheck[1] == 0 ? Text(" ") : s = 'Bucket_Mountainous_Landscape';
                            print(s);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text('Mountainous \nLandscape', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center,),
                          ),
                          color: defaultCheck[1] == 0 ? Colors.white : Colors.grey[350],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2),)
                        ),
                      ),
                        
                      // Coastal Landscape 
                      SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                        FlatButton(
                          onPressed: () {
                            setState(()
                            {
                              updateState(2);
                            });
                            defaultCheck[2] == 0 ? Text(" ") : s = 'Bucket_Coastal_Landscape'; 
                            print(s);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Coastal \nLandscape', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                          ),
                          color: defaultCheck[2] == 0 ? Colors.white : Colors.grey[350],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))
                        ),
                      ),
                    ],
                  ),

                  Padding(padding: const EdgeInsets.only(top: 10.0)),
                  
                  // Row 2 of user tag preferences
                  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // Urban Landscape
                    SizedBox(
                      width: 125.0,
                      height: 48.0,  
                      child:
                      FlatButton(
                        onPressed: () {
                          setState(()
                          {
                            updateState(3);
                            
                          });
                          defaultCheck[3] == 0 ? Text(" ") : s = 'Bucket_Urban_Landscape';
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Urban \nLandscape', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                        ),
                        color: defaultCheck[3] == 0 ? Colors.white : Colors.grey[350],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))
                      ),
                    ),

                    // Entertainment 
                    SizedBox(
                      width: 125.0,
                      height: 48.0,  
                      child:
                      FlatButton(
                        onPressed: () {
                          setState(()
                          {
                            updateState(4);
                          });
                          defaultCheck[4] == 0 ? Text(" ") : s = 'Bucket_Entertainment'; 
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(1.5),
                          child: Text('Entertainment', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center,),
                        ),
                        color: defaultCheck[4] == 0 ? Colors.white : Colors.grey[350],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2),)
                      ),
                    ),
                  
                    // Adventure
                    SizedBox(
                      width: 125.0,
                      height: 48.0,  
                      child:
                      FlatButton(
                        onPressed: () {
                          setState(()
                          {
                            updateState(5);
                          });
                          defaultCheck[5] == 0 ? Text(" ") : s = 'Bucket_Adventure';
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Text('Adventure', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                        ),
                        color: defaultCheck[5] == 0 ? Colors.white : Colors.grey[350],
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))
                        ),
                      ),
                    ],
                  ),
                    
                  Padding(padding: const EdgeInsets.only(top: 10.0)),

                  // Row 3 of user tag preferences 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    
                    children: <Widget>[
                      // Landmark
                      SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                        FlatButton(
                          onPressed: () {
                            setState(()
                            {
                              updateState(6);
                            });
                            defaultCheck[6] == 0 ? Text(" ") : s = 'Bucket_Landmark';
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Landmark', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                          ),
                          
                          color: defaultCheck[6] == 0 ? Colors.white : Colors.grey[350],
                          shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(5.0),side: BorderSide(width:2))
                          ),
                        ),

                      // Vibrant Atmosphere 
                      SizedBox(
                        width: 125.0,
                        height: 48.0,  
                        child:
                        FlatButton(
                          onPressed: () {
                            setState(()
                            {
                              updateState(7);
                            });
                            defaultCheck[7] == 0 ? Text(" ") : s = 'Bucket_Vibrant_Atmosphere';
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Vibrant \nAtmosphere', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center,),
                          ),
                          color: defaultCheck[7] == 0 ? Colors.white : Colors.grey[350],
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2),)
                          ),
                        ),

                        // Chill Atmosphere 
                        SizedBox(
                          width: 125.0,
                          height: 48.0,  
                          child:
                          FlatButton(
                            onPressed: () {
                              setState(()
                              {
                                updateState(8);
                              });
                              defaultCheck[8] == 0 ? Text(" ") : s = 'Bucket_Calm_Atmosphere';
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Chill \nAtmosphere', style:TextStyle(fontSize: 14.0), textAlign: TextAlign.center),
                            ),
                            color: defaultCheck[8] == 0 ? Colors.white : Colors.grey[350],
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(width:2))),   
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 20.0),

                      // Proceed button 
                      Align(
                        alignment: FractionalOffset.bottomCenter,
                        
                        child: RaisedButton(

                          onPressed: (){
                          Collections().updateBucketTag(s);
                          stateDefault() ? Text(' ') : 
                            Navigator.pushAndRemoveUntil(
                              context, 
                              CupertinoPageRoute(builder: (context) => SwipesTutorial()), (r) => false);
                          },

                          child: Text('Proceed', style:TextStyle(fontSize:15.0, color: Colors.black)),
                          color: stateDefault()? Colors.grey[200] : Colors.grey
                        ),
                      ),
                    ],
                  ),
                )
              );
  }
}