import 'package:flutter/material.dart';
import 'chatmodel.dart';
import 'chatdetails.dart';

class ChatsPage extends StatefulWidget {
  @override
  _ChatsPageState createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyData.length,
      itemBuilder: (context, index) => Column(
        children: <Widget>[
         /* Divider(
            height: 10.0,
          ),*/
          RaisedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetails(index),
                ),
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                radius: 20,
                foregroundColor: Theme.of(context).primaryColor,
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(dummyData[index].profilepic),
              ),
              title: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    dummyData[index].name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    dummyData[index].time,
                    style: TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
              subtitle: Container(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  dummyData[index].message,
                  style: TextStyle(color: Colors.grey, fontSize: 16.0),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
