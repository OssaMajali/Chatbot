import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color.fromRGBO(250, 250, 250, 1.0),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 100),
                    child: Text(
                      'Stay at home',

                      style: TextStyle(
                        letterSpacing: 2,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CM Sans Serif' ,
                          color: Color.fromRGBO(27, 141, 86, 1.0)),

                    ),
                  ),
                  SizedBox(height: 10,),
                  Container(
                    margin: EdgeInsets.all(11),
                    child: Text(
                      'As COVID-19 is now become a thread and spreads very fast so stay at home,save yourself and save your society',
                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontFamily: 'WorkSans',
                          fontSize: 23,
                          color: Colors.black54
                          ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(child: Container(child: Image.asset('assets/images/5.png'))),

            Container(
              margin: EdgeInsets.all(32),
              padding: EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(27, 141, 86, 1.0),
                  borderRadius: BorderRadius.circular(50)),
              child: Center(
                child: Text(
                  'GET STARTED',
                  style: TextStyle(
                    letterSpacing: 4,
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
