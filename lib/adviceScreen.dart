import 'coronaDetails.dart';
import 'dialog.dart';
import 'spread.dart';
import 'symptoms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AdviceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left:20.0 , right: 20.0 ,top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SvgPicture.asset('assets/images/menu.svg' , height: 23 ,color:  Color.fromRGBO(238, 72, 93, 1)),
                        GestureDetector(
                            onTap: (){
                              showDialog(
                                context: context,
                                builder: (BuildContext context) => CustomDialog(
                                  title: "Ossama Majali",
                                  description:
                                  "IT developer and 3rd year student in big data : massive data analysis and management license.",
                                  primaryButtonText: "Contact me",

                                ),
                              );
                            },
                            child: SvgPicture.asset('assets/images/icons8-info-2.svg' , height: 30, color: Color.fromRGBO(238, 72, 93, 1),))
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20.0, top: 20),
                        child: Container(
                          child: Text(
                            'Coronavirus (covid-19)\ninformation',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 30,
                              fontFamily: 'Balsamiq Sans Bold',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Container(
                  height: 150,
                  width: double.infinity,
                  child: Stack(
                    alignment: Alignment.bottomLeft,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(
                          // left side padding is 40% of total width
                          left: MediaQuery.of(context).size.width * .4,
                          top: 20,
                          right: 20,
                        ),
                        height: 130,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 6,
                              offset:
                                  Offset(0, 3), // changes position of shadow
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: [
                              Color.fromRGBO(238, 72, 93, 1.0),
                              Color.fromRGBO(238, 109, 124, 1.0)
                            ],
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                    text: "Stay at home \n",
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold)),
                                TextSpan(
                                  text: "All you need is stay at \nhome ",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.7),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Image.asset("assets/images/nurse.png"),
                      ),
                      Positioned(
                        top: 30,
                        right: 10,
                        child: SvgPicture.asset("assets/images/virus.svg"),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Stack(
                      children: <Widget>[
                        ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>CoronaDetails()));
                          },
                          leading: Image.asset('assets/images/virus-2.png'),
                          title: Text(
                            'Covid 19',
                            style: TextStyle(
                                fontFamily: 'Balsamiq Sans Bold', fontSize: 23),
                          ),
                          subtitle: Text("What's corona virus ?",
                              style: TextStyle(
                                  fontFamily: 'Balsamiq Sans Regular',
                                  color: Colors.grey)),
                        ),
                        Positioned( top: 21 , right: 10, child: Icon(Icons.arrow_forward_ios)),

                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 10, top: 10),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15.0, left: 5),
                          child: Text(
                            "Preventions",
                            style: TextStyle(
                                letterSpacing: 1,
                                fontFamily: 'CM Sans Serif',
                                fontSize: 20,
                                color: Colors.black87),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/p1.png',
                              width: 60,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Wash Hands',
                              style: TextStyle(
                                  fontFamily: 'Balsamiq Sans Regular',
                                  fontSize: 14,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/p2.png',
                              width: 60,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Use Masks',
                              style: TextStyle(
                                  fontFamily: 'Balsamiq Sans Regular',
                                  fontSize: 14,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/p4.png',
                              width: 60,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Drink Water',
                              style: TextStyle(
                                  fontFamily: 'Balsamiq Sans Regular',
                                  fontSize: 14,
                                  color: Colors.black),
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Image.asset(
                              'assets/images/p3.png',
                              width: 60,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'No Contacts',
                              style: TextStyle(
                                  fontFamily: 'Balsamiq Sans Regular',
                                  fontSize: 14,
                                  color: Colors.black),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Stack(
                      children: <Widget>[
                        ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Symptoms()));
                          },
                          leading: Image.asset('assets/images/syp1.png'),
                          title: Text(
                            'Symptoms',
                            style: TextStyle(
                                fontFamily: 'Balsamiq Sans Bold', fontSize: 23),
                          ),
                          subtitle: Text("What are the corona symptoms ?",
                              style: TextStyle(
                                  fontFamily: 'Balsamiq Sans Regular',
                                  color: Colors.grey)),
                        ),
                        Positioned( top: 21 , right: 10, child: Icon(Icons.arrow_forward_ios)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10),
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Stack(
                     children: <Widget>[
                       ListTile(
                         onTap: (){
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Spread()));
                         },
                         leading: Image.asset('assets/images/spr.png'),
                         title: Text(
                           'Spread',
                           style: TextStyle(
                               fontFamily: 'Balsamiq Sans Bold', fontSize: 23),
                         ),
                         subtitle: Text("How covid-19 spread ?",
                             style: TextStyle(
                                 fontFamily: 'Balsamiq Sans Regular',
                                 color: Colors.grey)),
                       ),
                       Positioned( top: 21 , right: 10, child: Icon(Icons.arrow_forward_ios)),
                     ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
