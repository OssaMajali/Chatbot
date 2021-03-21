import 'package:flutter/material.dart';
class CoronaDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/qarantine.png'),
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
                            ' Coronavirus(Covid 19)',
                            style: TextStyle(
                                fontFamily: 'Acme-Regular', fontSize: 35,
                                color: Color.fromRGBO(239, 126, 140, 1),
                            fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 30),
                        child: Text(
                          "COVID-19 is a new illness that can affect your lungs and airways. It's caused by a virus called coronavirus. It was discovered in December 2019 in Wuhan, Hubei, China.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 17,
                              height: 1.4,
                              fontFamily: 'Balsamiq Sans Regular',
                              color: Color.fromRGBO(239, 126, 140, 1)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, right: 20, top: 10),
                        child: Text(
                          "Common signs of infection include respiratory symptoms, fever, cough, shortness of breath and breathing difficulties. In more severe cases, infection can cause pneumonia, severe acute respiratory syndrome, kidney failure and even death.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 17,
                              height: 1.4,
                              fontFamily: 'Balsamiq Sans Regular',
                              color: Colors.grey.shade500),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0, right: 20, top: 10),
                        child: Text(
                          "Standard recommendations to prevent infection spread include regular hand washing, covering mouth and nose when coughing and sneezing, thoroughly cooking meat and eggs. Avoid close contact with anyone showing symptoms of respiratory illness such as coughing and sneezing.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 17,
                              height: 1.4,
                              fontFamily: 'Balsamiq Sans Regular',
                              color: Colors.grey.shade500),
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
