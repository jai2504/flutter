import 'package:contacts_service/contacts_service.dart';
import 'package:flutter/material.dart';
class Contactslis extends StatefulWidget {
  Contactslis();
  @override
  _ContactslisState createState() => _ContactslisState();
}

class _ContactslisState extends State<Contactslis> {
 List<Contact> contact=[];
  @override
  void initState(){
    super.initState();
    getContacts();
  }
   getContacts() async{
    List<Contact> _contacts = (await ContactsService.getContacts(withThumbnails: false)).toList();
    setState(() {
      contact=_contacts;
    });
  }
  get len => contact.length;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        leading: IconButton(icon: Icon(Icons.arrow_back), onPressed:(){
          setState(() {
            Navigator.pop(context);
          });
        }),
        title: Text('Select Contact',style: TextStyle(color:Colors.white),),
        bottom: PreferredSize(child: Text('$len Contacts'), preferredSize: null),
        actions: <Widget>[
          Icon(Icons.search,color: Colors.white,),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 7)),
          Icon(Icons.more_vert,color: Colors.white,)
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: len,
              itemBuilder: (context,index){
                Contact c=contact[index];
                return ListTile(
                  title: Text(c.displayName),
                  subtitle: Text(c.phones.elementAt(0).value),
                );
              })
          ],
        ),
      ),
    );
  }
}