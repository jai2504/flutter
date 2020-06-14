import 'package:flutter/material.dart';
import 'package:watsapp/main.dart';
import 'chatspage.dart';
import 'callspage.dart';
import 'status.dart';
import 'camerapage.dart';
class Outlook extends StatefulWidget {
  var cameras;
  Outlook(this.cameras);
  @override
  _OutlookState createState() => _OutlookState();
}

class _OutlookState extends State<Outlook> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState(){
    super.initState();
  _tabController=TabController(length: 4, vsync: this, initialIndex: 1);
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:Text('Whatsapp') ,
        elevation: 0.5,
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.white,
          tabs: <Widget>[
            Tab(
              icon:Icon(Icons.camera_alt),
            ),
            Tab(
              text: 'Chats',
            ),
             Tab(
              text: 'Status',
            ),
            Tab(
              text:'Calls',
            )
          ],
        ),
        actions: <Widget>[
          Icon(Icons.search),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 7),
          ),
          Icon(Icons.more_vert)
        ],
      ),
      body: 
      TabBarView(
        controller: _tabController,
        children: <Widget>[CameraPage(cameras),ChatsPage(),StatusPage(),CallsPage()]),
      floatingActionButton: FloatingActionButton(onPressed: (){
        print('Button Pressed');
      },
      backgroundColor: Theme.of(context).accentColor,
      child: Icon(Icons.message,color: Colors.white,),
      ),
    ); 
  }
}
