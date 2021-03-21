import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import 'dialog.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {

   void _launchURL(String number) async {
    var url = "tel:$number";
    try {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }catch(_){

    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      padding: const EdgeInsets.only(
                          left: 20.0, right: 20.0, top: 20),
                      child: Container(
                        child: Text(
                          'Coronavirus (covid-19)\nContacts',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            fontFamily: 'Balsamiq Sans Bold',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                contacts("Allo yakada","080 100 47 47","assets/images/phone-2.svg"),
                contacts("SOS Médecin","022 44 44 44","assets/images/scope.svg"),
                contacts("Maroc Assistance","022 30 30 30","assets/images/phone-2.svg"),
                contacts("Ambulance","150","assets/images/ambulance.svg"),
                contacts("Police","190","assets/images/policeman.svg"),
                contacts("Gendarmerie","177","assets/images/policeman-2.svg"),

              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget contacts(String title , String subtitle, String picture){
     return  Padding(
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
           padding: EdgeInsets.all(10.0),
           child: Stack(
             children: <Widget>[
               ListTile(
                 onTap: (){
                   _launchURL(subtitle);
                 },
                 leading: SvgPicture.asset(picture,color: Colors.pink ,width: 40, ),
                 title: Text(
                   title,
                   style: TextStyle(
                       fontFamily: 'Balsamiq Sans Bold', fontSize: 23),
                 ),
                 subtitle: Text(subtitle,
                     style: TextStyle(
                         fontFamily: 'Balsamiq Sans Bold',
                         color: Colors.pink,
                         fontSize: 15
                     )),
               ),
               Positioned( top: 27 , right: 10, child: Icon(Icons.arrow_forward_ios,size: 16,)),
             ],
           ),
         ),
       ),
     );
  }
}
