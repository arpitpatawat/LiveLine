import 'package:flutter/material.dart';
import 'package:vit_hack_2020/bpDetail.dart';
import 'package:vit_hack_2020/history.dart';
import 'package:vit_hack_2020/hrDetail.dart';
import 'package:vit_hack_2020/oxDetail.dart';
import 'package:vit_hack_2020/pwvDetail.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        brightness: Brightness.dark,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

final GlobalKey<FormState> fromKey = GlobalKey<FormState>();  

  String email;
  String password;

  Future <void> SignIn() async {
    if(fromKey.currentState.validate()){
      fromKey.currentState.save();
      try{
        await Firebase.initializeApp();
        FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
        final User currentUser = FirebaseAuth.instance.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>DetailsPage(users: currentUser,)));
      }
      catch(e){
        print(e);
      }
    }
  }
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
                  new Icon(Icons.home_outlined,size: 25,color: Colors.white,),
                  new Text("Home",style: TextStyle(fontSize: 15,color: Colors.white,fontFamily: "Maven Pro"))
                ],
              ),
              new Column(
                children: [
                  new Icon(Icons.notifications_outlined,size: 25,color: Colors.grey[800],),
                  new Text("Notifications",style: TextStyle(fontSize: 15,color: Colors.grey[800],fontFamily: "Maven Pro"))
                ],
              ),
              new GestureDetector(
                child: new Column(
                children: [
                  new Icon(Icons.alarm,size: 25,color: Colors.grey[800],),
                  new Text("History",style: TextStyle(fontSize: 15,color: Colors.grey[800],fontFamily: "Maven Pro"))
                ],
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>History()));
              },
              )
            ],
          ),
          ),
        ),
      ),
      body: new Container(
        padding: const EdgeInsets.only(top: 65),
        child: new Column(
          children: [
            new Row(
              children: [
                new Row(
                  children: [
                    new Padding(padding: const EdgeInsets.symmetric(horizontal: 5),),
                    new Icon(Icons.menu,size: 30,color: Colors.white),
                  ],
                ),
                new Padding(padding: const EdgeInsets.symmetric(horizontal: 54),),
                new Text("liveline",style: TextStyle(fontSize: 30,color:Color(0xffbFF57F5),fontFamily: "Juiluis",)),
                new Padding(padding: const EdgeInsets.symmetric(horizontal: 50),),
                new Row(
                  children: [
                    new Icon(Icons.settings_outlined,size: 30,color: Colors.white),
                  ],
                )
              ],
            ),
            new Padding(padding: const EdgeInsets.only(top: 40),),
            new Column(
              children: [
               new Row(
                 children: [
                    new Padding(padding: const EdgeInsets.symmetric(horizontal: 5),),
                    new Text("Your Data",style: TextStyle(fontSize: 28,color: Colors.white,fontFamily:"Maven Pro",fontWeight: FontWeight.w600),)
                 ],
               ),
               new Padding(padding :const EdgeInsets.only(top: 15)),
               new Container(
                 padding: const EdgeInsets.all(23),
                 child: new Column(
                   children: [
                     new GestureDetector(
                       child: new Card(
                 color: Color(0xffb690062),
                 shape : new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)),),
                 new StreamBuilder<DocumentSnapshot>
      (
        stream: FirebaseFirestore.instance.collection("users").doc(users.uid).snapshots(),
        builder: ( BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if(!snapshot.hasData) return new Center(child:new CircularProgressIndicator());

          return new Container(
                 child: new Column(
                   children: [
                     new Stack(
                       children: [
                         new Container(
                           height: 100,width: 800,
                           alignment: Alignment.center,
                           child: new Text("Body Temp",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: "Maven Pro",fontWeight: FontWeight.w600),),
                         )
                       ],
                     )
                   ],
                 )
               ),
                    onTap:(){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>BPDetail()));
                    }
                     ),
               new Padding(padding :const EdgeInsets.only(top: 3)),
               new GestureDetector(
                   child: new Card(
                   color: Color(0xffbA5009A),
                   shape :new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                   child: new Column(
                     children: [
                       new Stack(
                         children: [
                           new Container(
                             height: 100,width: 800,
                             alignment: Alignment.center,
                             child: new Text("Heart Rate",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: "Maven Pro",fontWeight: FontWeight.w600),),
                           )
                         ],
                       )
                     ],
                   )
                 ),
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>HRDetail()));
                 },
               ),
               new Padding(padding :const EdgeInsets.only(top: 3)),
               new GestureDetector(
                  child: new Card(
                  color: Color(0xffbFF57F5),
                  shape :new RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                  child: new Column(
                     children: [
                       new Stack(
                         children: [
                           new Container(
                             height: 100,width: 800,
                             alignment: Alignment.center,
                             child: new Text("SPo2",style: TextStyle(fontSize: 30,color: Colors.white,fontFamily: "Maven Pro",fontWeight: FontWeight.w600),),
                           )
                         ],
                       )
                     ],
                   )
                 ),
                 onTap: (){
                   Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>OXDetail()));
                 },
               ),
                   ],
                 ),
               )
              ],
            )
          ],
        ),
      ),
    );
  }
}
