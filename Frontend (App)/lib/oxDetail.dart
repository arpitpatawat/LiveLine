import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OXDetail extends StatefulWidget {
  @override
  _OXDetailState createState() => _OXDetailState();
}

class _OXDetailState extends State<OXDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomAppBar(
        color: Colors.black,
        child: new SizedBox(
          height: 75,
          child: new Container(
            padding: const EdgeInsets.all(5),
            child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              new Column(
                children: [
                  new GestureDetector(
                    child: new Icon(Icons.home_outlined,size: 25,color: Colors.grey[800],),
                    onTap: (){
                      Navigator.pop(context);
                    },
                  ),
                  new Text("Home",style: TextStyle(fontSize: 15,color: Colors.grey[800],fontFamily: "Maven Pro"))
                ],
              ),
              new Column(
                children: [
                  new Icon(Icons.notifications_outlined,size: 25,color: Colors.grey[800],),
                  new Text("Notifications",style: TextStyle(fontSize: 15,color: Colors.grey[800],fontFamily: "Maven Pro"))
                ],
              ),
              new Column(
                children: [
                  new Icon(Icons.alarm,size: 25,color: Colors.grey[800],),
                  new Text("History",style: TextStyle(fontSize: 15,color: Colors.grey[800],fontFamily: "Maven Pro"))
                ],
              ),
            ],
          ),
          ),
        ),
      ),
      body: new Container(
        padding: const EdgeInsets.only(top : 65),
        child: new Column(
          children: [
            new Row(
              children: [
                new Row(
                  children: [
                    new Padding(padding: const EdgeInsets.symmetric(horizontal: 5),),
                    new IconButton(icon: new Icon(Icons.arrow_back_ios,size: 30,color: Colors.white),onPressed: (){
                      Navigator.pop(context);
                    }),
                    new Padding(padding: const EdgeInsets.symmetric(horizontal: 40)),
                    new Text("Oximetry",style: TextStyle(fontSize: 30,color:Colors.white,fontWeight: FontWeight.w700,fontFamily: "Maven Pro")),
                  ],
                ),
              ],
            ),
            new Padding(padding: const EdgeInsets.only(top : 65)),
            new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
              new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Text("% O2",style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: "Movan Pro")),
              ],
            ),
              new Padding(padding: const EdgeInsets.only(top:4),),
              new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                new Text("95",style: TextStyle(fontSize: 70,color: Colors.white,fontWeight: FontWeight.w600,fontFamily: "Movan Pro")),
              ],
            ),
            new Padding(padding: const EdgeInsets.only(top: 2)),
            new Text("Normal",style: TextStyle(fontSize: 45,color: Colors.green[800],fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
           new Padding(padding: const EdgeInsets.all(45),),
           new Row(
             children: [
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 5),),
              new Column(
                children: [
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Row(
                    children: [
                      new Text("",style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("Normal",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("Get Checked",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                ],
              ),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 80),),
              new Column(
                children: [
                  new Text("% O2",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 15)),
                  new Text("90-100",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 15)),
                  new Text("<90",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                ],
              ),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 10),),
            ],
           ),
          ],
        ),
        new Padding(padding: const EdgeInsets.only(top: 10),),
        new RaisedButton(
          color: Colors.white,
          shape: new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
          child:new Text("Go To Details",style: TextStyle(fontSize: 20,color: Colors.black,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
          onPressed: (){
            launch("");
          }
          )
          ],
        )
        ),
      );
  }
}