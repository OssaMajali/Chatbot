import 'package:flutter/material.dart';

class Spread extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/woman.jpg'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop(false);
                        },
                        child: Icon(Icons.arrow_back_ios)),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.24,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            ' Coronavirus Spread',
                            style: TextStyle(
                                fontFamily: 'Acme-Regular',
                                fontSize: 35,
                                color: Color.fromRGBO(239, 126, 140, 1),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 30),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Person-to-person spread as close contact with infected',
                                    style: TextStyle(
                                        fontSize: 22,
                                        height: 1.4,
                                        fontFamily: 'Balsamiq Sans Bold',
                                        color:
                                            Color.fromRGBO(239, 126, 140, 1)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "The coronavirus is thought to spread mainly from person to person. This can happen between people who are in close contact with one another.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 17,
                                  height: 1.4,
                                  fontFamily: 'Balsamiq Sans Regular',
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 30),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Touching or contact with infected surfaces or objects',
                                    style: TextStyle(
                                        fontSize: 22,
                                        height: 1.4,
                                        fontFamily: 'Balsamiq Sans Bold',
                                        color:
                                        Color.fromRGBO(239, 126, 140, 1)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "A person can get COVID-19 by touching a surface or object that has the virus on it and then touching their own mouth, nose, or possibly their eyes.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 17,
                                  height: 1.4,
                                  fontFamily: 'Balsamiq Sans Regular',
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 30),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Text(
                                    'Droplets that from infected person coughs or sneezes',
                                    style: TextStyle(
                                        fontSize: 22,
                                        height: 1.4,
                                        fontFamily: 'Balsamiq Sans Bold',
                                        color:
                                        Color.fromRGBO(239, 126, 140, 1)),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "The coronavirus is thought to spread mainly from person to person. This can happen between people who are in close contact with one another.",
                              textAlign: TextAlign.justify,
                              style: TextStyle(
                                  fontSize: 17,
                                  height: 1.4,
                                  fontFamily: 'Balsamiq Sans Regular',
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
