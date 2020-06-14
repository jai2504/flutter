import 'package:flutter/material.dart';

class ChatDetails extends StatelessWidget {
  final int number;
  ChatDetails(this.number);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColorLight,
      body: Center(
        child: Container(
          child: Text(
            'Chat of $number will be shown here',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w600, fontSize: 50),
          ),
        ),
      ),
    );
  }
}
