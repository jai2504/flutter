import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class Contactslis extends StatefulWidget {
  Contactslis();
  @override
  _ContactslisState createState() => _ContactslisState();
}

class _ContactslisState extends State<Contactslis> {
  List<ListTile> _optionsAndContacts = [];

  ListTile get _addGroup => ListTile(
        leading: CircleAvatar(
          child: Icon(
            Icons.group_add,
            color: Colors.white,
          ),
          backgroundColor: Theme.of(context).accentColor,
        ),
        title: Text('New Group'),
      );

  ListTile get _addContact => ListTile(
        leading: CircleAvatar(
          radius: 20,
          child: Center(
              child: Icon(
            Icons.person_add,
            color: Colors.white,
          )),
          backgroundColor: Theme.of(context).accentColor,
        ),
        title: Text('New Contact'),
      );

  @override
  void initState() {
    super.initState();
    getContacts();
  }

  ListTile _contactToListTile(Contact c) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.grey,
      ),
      title: Text(c.displayName),
      subtitle: Text(c.phones.isEmpty ? "" : c.phones.first.value),
    );
  }

  getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      List<Contact> contacts =
          (await ContactsService.getContacts(withThumbnails: false)).toList();

      List<ListTile> contactsAsList =
          contacts.map((c) => _contactToListTile(c)).toList();

      /// `🚀 First added addGroup and addContact options to the list 🚀`
      _optionsAndContacts = [_addGroup, _addContact];

      /// `🚀 Then add all the contacts to the list 🚀`
      setState(() => _optionsAndContacts.addAll(contactsAsList));
    }
  }

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
              child: Text('${_optionsAndContacts.length - 2} Contacts'),
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
      body: ListView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        children: _optionsAndContacts,
      ),
    );
  }
}
