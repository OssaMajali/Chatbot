import 'package:flutter/material.dart';

class Symptoms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,

          decoration: BoxDecoration(
            color: Color.fromRGBO(253, 236, 238, 1.0),
            image: DecorationImage(
                image: AssetImage('assets/images/s.png'),
                alignment: Alignment.topCenter,
                fit: BoxFit.fitWidth),
          ),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
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
                height: MediaQuery.of(context).size.height * 0.31,
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
                            'Symptomes',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                                fontFamily: 'Acme-Regular',
                                fontSize: 35,
                            color: Color.fromRGBO(239, 126, 140, 1)),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 30),
                        child: Text(
                          "COVID-19 symptoms range from mild to severe. It takes 2-14 days after exposure for symptoms to develop. Symptoms may include:",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 17,
                              height: 1.4,
                              fontFamily: 'Balsamiq Sans Regular',
                              color: Colors.grey.shade700),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 10),
                        child: Image(
                          image: AssetImage('assets/images/imageSym.png'),
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
  }
}
