import 'countries.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'homeScreen.dart';
import 'package:timeago/timeago.dart' as timeago;

class CountriesDetails extends StatelessWidget {
  final DataCountries dataCountries;
  const CountriesDetails(this.dataCountries);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Color.fromRGBO(238, 72, 93, 1),
        title: Text(
          'COUNTRY',
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
              fontFamily: 'CM Sans Serif',
              fontSize: 20),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
          width: double.infinity,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 15),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              height: 25,
                              width: 40,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(dataCountries.flag),
                                    fit: BoxFit.fill),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  dataCountries.country,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontFamily: 'Balsamiq Sans Bold'),
                                ),
                              ),
                            ),
                            Spacer(),
                            Expanded(
                              child: Container(
                                child: Text(
                                  timeago
                                      .format(
                                          new DateTime.fromMillisecondsSinceEpoch(
                                              dataCountries.updated))
                                      .toString(),
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontSize: 14,
                                      fontFamily: 'Balsamiq Sans Bold'),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Text(' '),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black54,
                              size: 17,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Wrap(
                runSpacing: 10,
                spacing: 10,
                children: <Widget>[
                  InfoCard(
                    title: 'Confirmed Cases',
                    effectedNum: dataCountries == null ? 0 : dataCountries.cases,
                    profile: Image.asset(
                      'assets/images/ico1.png',
                      width: 50,
                      height: 50,
                    ),
                    colorText: Colors.blue.shade600,
                  ),
                  InfoCard(
                    title: 'Total Deaths',
                    effectedNum: dataCountries == null ? 0 : dataCountries.deaths,
                    profile: Image.asset(
                      'assets/images/ico2.png',
                      width: 50,
                      height: 50,
                    ),
                    colorText: Colors.red.shade700,
                  ),
                  InfoCard(
                    title: 'Total Recovered',
                    effectedNum:
                        dataCountries == null ? 0 : dataCountries.recovered,
                    profile: Image.asset(
                      'assets/images/ico3.png',
                      width: 50,
                      height: 50,
                    ),
                    colorText: Colors.green,
                  ),
                  InfoCard(
                    title: 'Total Active',
                    effectedNum: dataCountries == null ? 0 : dataCountries.active,
                    profile: Image.asset(
                      'assets/images/ico4.png',
                      width: 50,
                      height: 50,
                    ),
                    colorText: Colors.yellow.shade700,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0.0, right: 0.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 5,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Column(
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Today Cases',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    'Balsamiq Sans Regular',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              dataCountries == null
                                                  ? "0"
                                                  : dataCountries.todayCases
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.blue),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'People',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Today Deaths',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    'Balsamiq Sans Regular',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              dataCountries == null
                                                  ? "0"
                                                  : dataCountries.todayDeaths
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'People',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Today Recover',
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    'Balsamiq Sans Regular',
                                              ),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              dataCountries == null
                                                  ? "0"
                                                  : dataCountries.todayRecovered
                                                      .toString(),
                                              style: TextStyle(
                                                  fontSize: 23,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.yellow.shade800),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'People',
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 0),
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Image.asset('assets/images/map.png'),
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
