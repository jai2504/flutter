import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Contactslis extends StatefulWidget {
  Contactslis();
  @override
  _ContactslisState createState() => _ContactslisState();
}

class _ContactslisState extends State<Contactslis> {
  List<Contact> contact = [];
  @override
  void initState() {
    super.initState();
    getContacts();
  }

  getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      List<Contact> _contacts =
          (await ContactsService.getContacts(withThumbnails: false)).toList();
      setState(() {
        contact = _contacts;
      });
    }
  }

  get len => contact.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65),
        child: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          leading: Padding(
            padding: EdgeInsets.only(top: 15),
            child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                }),
          ),
          title: Padding(
            padding: EdgeInsets.only(top: 20),
            child: Text(
              'Select Contact',
              style: TextStyle(color: Colors.white),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: null,
            child: Container(
              margin: EdgeInsets.only(left: 72, bottom: 5),
              height: 18.0,
              alignment: Alignment.bottomLeft,
              child: Text('$len Contacts'),
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 5)),
            Padding(
              padding: EdgeInsets.only(top: 15),
              child: Icon(
                Icons.more_vert,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
       body: Column(children: <Widget>[
         ListTile(
           leading: CircleAvatar(
             child:Icon(Icons.group_add,color: Colors.white,),
             backgroundColor: Theme.of(context).accentColor,
           ),

         ),
         ListTile(
             leading: CircleAvatar(
               radius: 25,
             child:
             Center(child: Icon(Icons.person_add,color: Colors.white,)),
             backgroundColor: Theme.of(context).accentColor,
           ),
         ),
        Expanded(
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: len,
              itemBuilder: (context, index) {
                Contact c = contact[index];
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey,
                      ),
                      title: Text(c.displayName),
                      subtitle: Text(c.phones.elementAt(0).value),
                    )
                  ],
                );
              }
              ),
        ),
      ]),
    );
  }
}
/*

     */