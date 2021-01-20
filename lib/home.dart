
import 'package:flutter/material.dart';
import 'package:flutter_app/formval.dart';
import 'package:flutter_app/transport.dart';

class Home extends StatefulWidget {

  final FormVal value;
  Home({ this.value,Key key}):super(key: key);


  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey,
        key: scaffoldKey,
        drawer: Drawer(elevation: 20.0,
          child: ListView(
            children: <Widget>[
              DrawerHeader(child: Text("${widget.value.firstName} ${widget.value.lastName}", style: TextStyle(color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),),decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight, List: [Colors.red, Colors.indigo, ])), ),
              ListTile(
                leading: Icon(Icons.account_circle),
                title: Text("Profile"),

              ),
              ListTile(
                leading: Icon(Icons.message),
                title: Text("Messages"),
                contentPadding: EdgeInsets.all(20.0),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text("Settings"),
              ),
            ],
          ),
        ),
        body: SafeArea(
          child: Stack(children: <Widget>[
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(icon: Icon(Icons.menu,size: 30.0,), onPressed: () => scaffoldKey.currentState.openDrawer()),// or Scaffold.of(context).openDrawer()
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top:20.0,left: 10.0, ),
              color: Colors.red,
              margin: EdgeInsets.only(top: 450.0),
              height: 250.0,
              width: 350.0,
              child: ListView(
                children:getTransportCompanyInArea(),
                scrollDirection: Axis.horizontal,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100,left: 50.0),
              height: 47.5,
              width: 300.0,
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 20.0,
                    )
                  ]
              ),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "What are you going?",
                    hintStyle: TextStyle(fontSize: 15.0, fontFamily: "Gotham"),
                    prefixIcon: Icon(Icons.search,color: Colors.black,),
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent))
                ),
              ),
            )
          ],
          ),
        ),
      ),
    );
  }
  List<Transport> getTrans(){
    List<Transport>transes=[];
    for (int i=0; i < 10; i++){
      Transport myTrans = Transport("Land Star",);
      transes.add(myTrans);
    }
    return transes;
  }

  List<Widget> getTransportCompanyInArea(){
    List<Transport>transes = getTrans();
    List<Widget>cards=[];
    for(Transport transy in transes){
      cards.add(transportCard(transy));
    }
    return cards;
  }

}
Widget transportCard(Transport transport){
  return Container(
    margin: EdgeInsets.only( right: 20.0,bottom: 10.0),
    width: 160,
    decoration: BoxDecoration(gradient: LinearGradient(List: [Colors.purple,Colors.blueAccent],begin: Alignment.centerLeft,end: Alignment.topLeft),
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey,
            blurRadius: 20.0,

          )
        ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(transport.transportName, style: TextStyle(fontWeight: FontWeight.w900,fontSize: 24.0,),)

          ],
        ),
        Image.asset("assets/Landstarlog.png")
      ],
    ),
  );
}