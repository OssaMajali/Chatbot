import 'countriesDeatails.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:timeago/timeago.dart' as timeago;

import 'dialog.dart';

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  final ScrollController _scrollController = ScrollController();
  List<DataCountries> worldData;
  Future<List<DataCountries>> _getAllData() async {
    List<DataCountries> worldData = [];
    http.Response response =
        await http.get('https://corona.lmao.ninja/v2/countries');
    var data = json.decode(response.body);
    for (var i in data) {
      DataCountries dataCountries = DataCountries(
          i["updated"],
          i["country"],
          i["cases"],
          i["deaths"],
          i["recovered"],
          i["todayCases"],
          i["todayDeaths"],
          i["todayRecovered"],
          i["active"],
          i["countryInfo"]["flag"]);
      worldData.add(dataCountries);
    }
    print(worldData.length);
    return worldData;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var datat = _getAllData();
  }
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
                            'Coronavirus (covid-19)\nCountries',
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
                padding: const EdgeInsets.only(left:100.0,right: 100,top: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.pink,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  padding: EdgeInsets.all(2),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: <Widget>[
                  Scrollbar(
                    controller: _scrollController,
                    child: FutureBuilder(
                        future: _getAllData(),
                        builder:
                            (BuildContext context, AsyncSnapshot snapshot) {
                          if (snapshot.data == null) {
                            return Container(
                              height:MediaQuery.of(context).size.height/2,
                                child:
                                    Center(child: CircularProgressIndicator()));
                          } else {
                            return ListView.builder(
                              controller: _scrollController,
                              shrinkWrap: true,
                              itemCount: snapshot.data.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _listItem(snapshot,index);
                              },
                            );
                          }
                        }),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }


  _listItem (AsyncSnapshot snapshot, int index){
    return Stack(
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
                snapshot.data[index].flag),
          ),
          title: Text(
            snapshot.data[index].country,
            style: TextStyle(
                fontFamily: 'Balsamiq Sans Bold',
                fontSize: 20),
          ),
          subtitle: Text(
            timeago
                .format(new DateTime
                .fromMillisecondsSinceEpoch(
                snapshot.data[index].updated))
                .toString(),
            style: TextStyle(
                fontFamily: 'Balsamiq Sans Regular',
                fontSize: 14),
          ),
          onTap: () {
            Navigator.push(context, new MaterialPageRoute(builder: (context){
              return CountriesDetails(snapshot.data[index]);

            }));
          },
        ),
        Positioned(
            top: 26,
            right: 50,
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            )),
      ],
    );
  }
}


class DataCountries {
  final int updated;
  final String country;
  final int cases;
  final int deaths;
  final int recovered;
  final int todayCases;
  final int todayDeaths;
  final int todayRecovered;
  final int active;
  final String flag;
  DataCountries(
      this.updated,
      this.country,
      this.cases,
      this.deaths,
      this.recovered,
      this.todayCases,
      this.todayDeaths,
      this.todayRecovered,
      this.active,
      this.flag);
}
