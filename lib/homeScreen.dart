import 'dart:convert';
import 'adviceScreen.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

import 'dialog.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  Map worldData;
  Map moroccoData;
  getAllData() async {
    http.Response response = await http.get('https://corona.lmao.ninja/v2/all');
    setState(() {
      worldData = json.decode(response.body);
    });
  }
  getMoroccoData() async {
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries/Morocco');
    setState(() {
      moroccoData = json.decode(response.body);
    });
  }
  @override
  void initState(){
    super.initState();
    getAllData();
    getMoroccoData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refreshData,
          color: Colors.green,
          child: SingleChildScrollView(
            child: Wrap(
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
                         padding: const EdgeInsets.only(left:20.0 , right: 20.0 ,top: 20),
                         child: Container(
                           child: Text('Coronavirus (covid-19)\ntracker' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, fontFamily: 'Balsamiq Sans Bold',),),
                         ),
                       ),
                     ],

                   ),
                 ],
               ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
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
                          Center(
                            child: Text(
                              'Global Cases',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                              fontFamily: 'Balsamiq Sans Bold'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.only(left: 20, top: 10, right: 20, bottom: 10),
                  width: double.infinity,
                  child: Wrap(
                    runSpacing: 10,
                    spacing: 10,
                    children: <Widget>[
                      InfoCard(
                        title: 'Confirmed Cases',
                        effectedNum: worldData == null ? 0 : worldData['cases'],
                        profile: Image.asset(
                          'assets/images/ico1.png',
                          width: 50,
                          height: 50,
                        ),
                        colorText: Colors.blue.shade600,
                      ),
                      InfoCard(
                        title: 'Total Deaths',
                        effectedNum: worldData == null ? 0 : worldData['deaths'],
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
                            worldData == null ? 0 : worldData['recovered'],
                        profile: Image.asset(
                          'assets/images/ico3.png',
                          width: 50,
                          height: 50,
                        ),
                        colorText: Colors.green,

                      ),
                      InfoCard(
                        title: 'Total Active',
                        effectedNum: worldData == null ? 0 : worldData['active'],
                        profile: Image.asset(
                          'assets/images/ico4.png',
                          width: 50,
                          height: 50,
                        ),
                        colorText: Colors.yellow.shade700,

                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0 ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(8),


                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          AssetImage('assets/images/maroc.png'),
                                      fit: BoxFit.fill),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                'Morocco',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    fontFamily: 'Balsamiq Sans Bold'),
                              ),
                              Spacer(),

                              Text(
                                moroccoData == null
                                    ? "0"
                                    : new DateFormat.yMMMd().add_Hm().format(
                                        new DateTime.fromMillisecondsSinceEpoch(
                                            moroccoData['updated'])),
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 14 , fontFamily: 'Balsamiq Sans Bold'),
                              ),
                              Text(' '),
                              Icon(Icons.access_alarm, color:Colors.black54 , size: 17,)
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
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
                                            'Cases',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              fontFamily: 'Balsamiq Sans Regular',),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            moroccoData == null
                                                ? "0"
                                                : moroccoData['cases'].toString(),
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
                                            'Deaths',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              fontFamily: 'Balsamiq Sans Regular',),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            moroccoData == null
                                                ? "0"
                                                : moroccoData['deaths']
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
                                            'Recovered',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              fontFamily: 'Balsamiq Sans Regular',),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            moroccoData == null
                                                ? "0"
                                                : moroccoData['recovered']
                                                    .toString(),
                                            style: TextStyle(
                                                fontSize: 23,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.green),
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
                                              fontFamily: 'Balsamiq Sans Regular',),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            moroccoData == null
                                                ? "0"
                                                : moroccoData['todayCases']
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
                                              fontFamily: 'Balsamiq Sans Regular',),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            moroccoData == null
                                                ? "0"
                                                : moroccoData['todayDeaths']
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
                                            'Active',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              fontFamily: 'Balsamiq Sans Regular',),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            moroccoData == null
                                                ? "0"
                                                : moroccoData['active']
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
                Container(height: 10,)
              ],
            ),
          ),
        ),
      ),

    );
  }
  Future<void> _refreshData() async {
    return setState(() {
      getAllData();
      getMoroccoData();
    });
  }
}
class InfoCard extends StatelessWidget {
  final String title;
  final int effectedNum;
  final Color iconColor;
  final Image profile;
  final Color colorText;
  const InfoCard(
      {Key key, this.title, this.effectedNum, this.iconColor, this.profile, this.colorText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        width: constraints.maxWidth / 2 - 5,
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.12),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/images/virus2.svg',
                      height: 20,
                      width: 20,
                      color: Colors.pink,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: 'Balsamiq Sans Regular',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(color: Color(0xFF1E2432)),
                          children: [
                            TextSpan(
                                text: new NumberFormat("#,###")
                                    .format(effectedNum)
                                    .toString(),
                                style: Theme.of(context)
                                    .textTheme
                                    .title
                                    .copyWith(fontWeight: FontWeight.bold , color: colorText)),
                            TextSpan(
                              text: '\nPeople',
                              style: TextStyle(fontSize: 12, height: 2 , fontFamily: 'Balsamiq Sans Regular'),
                            ),
                          ]),
                    ),
                  ),
                  Expanded(
                    child: profile,
                    //Image.asset('assets/images/confirmed.png' , width: 50,height: 50,),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
