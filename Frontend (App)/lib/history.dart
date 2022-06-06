import 'package:flutter/material.dart';


class History extends StatefulWidget {
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {

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
                  new Icon(Icons.alarm,size: 25,color: Colors.white,),
                  new Text("History",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Maven Pro"))
                ],
              ),
            ],
          ),
          ),
        ),
      ),
      body : new SingleChildScrollView(
        child: new Container(
        padding: const EdgeInsets.only(top: 65),
        child: new Column(
          children: [
            new Row(
              children: [
                new Row(
                  children: [
                    new Padding(padding: const EdgeInsets.symmetric(horizontal: 5),),
                    new GestureDetector(
                      child: new Icon(Icons.arrow_back_ios,size: 30,color: Colors.white),
                      onTap: (){
                        Navigator.pop(context);
                      }
                    )
                  ],
                ),
                new Padding(padding: const EdgeInsets.symmetric(horizontal: 60),),
                new Text("History",style: TextStyle(fontSize: 30,color:Colors.white,fontWeight: FontWeight.w700,fontFamily: "Maven Pro",)),
              ],
            ),
            new Padding(padding: const EdgeInsets.only(top: 50),),
            new Column(
              children: [
                new Text("Body Temp",style: TextStyle(fontSize: 35,color: Colors.white,fontFamily: "Maven Pro",fontWeight: FontWeight.w600)),
                new Padding(padding: const EdgeInsets.only(top:10),),
                new Row(
                  children: [
                    new Column(
                children: [
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Row(
                    children: [
                      new Text("",style: TextStyle(fontSize: 25,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                    ],
                  ),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("Today",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("7th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("8th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("9th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("10th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),)
                ],
              ),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 40),),
              new Column(
                children: [
                  new Text("temp",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("38.2",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("34",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("36",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("36.4",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("37.1",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                ],
              ),
                  ],
                ),
                new Text("Heart Rate",style: TextStyle(fontSize: 35,color: Colors.white,fontFamily: "Maven Pro",fontWeight: FontWeight.w600)),
                new Padding(padding: const EdgeInsets.only(top:10),),
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
                  new Text("Today",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("7th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("8th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("9th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                ],
              ),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 80),),
              new Column(
                children: [
                  new Text("BPM",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 15)),
                  new Text("68",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("100",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("58",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("62",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                ],
              ),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 10),),
            ],
           ),
           new Text("Oximetery",style: TextStyle(fontSize: 35,color: Colors.white,fontFamily: "Maven Pro",fontWeight: FontWeight.w600)),
                new Padding(padding: const EdgeInsets.only(top:10),),
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
                  new Text("7th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("8th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("9th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("10th Oct",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                ],
              ),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 80),),
              new Column(
                children: [
                  new Text("% O2",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("95",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("92",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("95",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                  new Padding(padding: const EdgeInsets.only(top: 10)),
                  new Text("98",style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: "Movan Pro",fontWeight: FontWeight.w700),),
                ],
              ),
              new Padding(padding: const EdgeInsets.symmetric(horizontal: 10),),
            ],
           ),
            ],
           ),
            ],
          ),
        ]
      )
    ),
      )
    );
  }
}

