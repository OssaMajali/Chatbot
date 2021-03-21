import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:bubble/bubble.dart';
import 'package:flutter_dialogflow/v2/auth_google.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'dialog.dart';

class Chat extends StatefulWidget {
  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  void response(query) async {
    AuthGoogle authGoogle =
        await AuthGoogle(fileJson: "assets/covidbot-mlxqdk-234212300c2a.json")
            .build();
    Dialogflow dialogflow = Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse aiResponse = await dialogflow.detectIntent(query);
   print(aiResponse.getListMessage()[0]["text"]["text"][0].toString());
    var data = aiResponse.getListMessage()[0]["text"]["text"][0].toString();
    setState(() {
      messsages.insert(0, {"data": 0, "message": data});
    });
  }

  final messageInsert = TextEditingController();
  List<Map> messsages = List();
  @override
   initState()  {
    // TODO: implement initState
    super.initState();
    messsages.insert(
        0, {"data": 0, "message": 'Hi, ask me anything about covid-19 !!!'});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      // backgroundColor:
      // Color.fromRGBO(237, 237, 237, 1.0),
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: Color.fromRGBO(238, 72, 93, 1.0),
        flexibleSpace: SafeArea(
          child: Container(
            padding: EdgeInsets.only(right: 16),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 20,
                ),
                CircleAvatar(
                  backgroundColor: Colors.white,
                  backgroundImage: AssetImage("assets/images/chatb.png"),
                  maxRadius: 20,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "CovidBot",
                        style: TextStyle(fontWeight: FontWeight.w700,color: Colors.white,fontSize: 15),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(Icons.brightness_1,color: Colors.green, size: 10,),
                          SizedBox(
                            width: 6,
                          ),

                          Text(
                            "Online",
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
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
                  child: SvgPicture.asset('assets/images/icons8-info-2.svg',
                      color: Colors.white),
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/back2.jpg'),
                fit: BoxFit.cover)),
        child: Column(
          children: <Widget>[
            Flexible(
                child: ListView.builder(
                    reverse: true,
                    itemCount: messsages.length,
                    itemBuilder: (context, index) => chat(
                        messsages[index]["message"].toString(),
                        messsages[index]["data"]))),
            Padding(
              padding: const EdgeInsets.only(left:10.0,right: 10),
              child: Container(
                padding: EdgeInsets.only(left: 16),
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Row(
                  children: <Widget>[
                    Flexible(
                        child: TextField(
                      cursorColor: Colors.pink,
                      controller: messageInsert,
                      decoration: InputDecoration.collapsed(
                          hintText: "Type message ...",
                          hintStyle: TextStyle(color: Colors.grey.shade500)),
                    )),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 4.0),
                      child: IconButton(
                          icon: Icon(
                            Icons.send,
                            size: 30.0,
                            color: Color.fromRGBO(238, 72, 93, 1.0),
                          ),
                          onPressed: () {
                            if (messageInsert.text.isEmpty) {
                              print("empty message");
                            } else {
                              setState(() {
                                messsages.insert(0,
                                    {"data": 1, "message": messageInsert.text});
                              });
                              response(messageInsert.text);
                              messageInsert.clear();
                            }
                          }),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  Widget chat(String message, int data) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Bubble(
          radius: Radius.circular(15.0),
          color: data == 0 ? Colors.white : Color.fromRGBO(238, 72, 93, 1.0),
          elevation: 0.0,
          alignment: data == 0 ? Alignment.topLeft : Alignment.topRight,
          nip: data == 0 ? BubbleNip.leftBottom : BubbleNip.rightTop,
          child: Padding(
            padding: EdgeInsets.all(2.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    child: Text(
                  message,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      color: data == 0 ? Colors.black : Colors.white,
                      fontFamily: 'Balsamiq Sans Regular'),
                ))
              ],
            ),
          )),
    );
  }
}
