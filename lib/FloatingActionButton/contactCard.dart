//@dart=2.9
import 'package:chatapp/Staticmodel/ChatModel.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget
{
  final ChatModel contact;

  const ContactCard({Key key, this.contact}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return ListTile(
      leading: Container(
        height: 55,
        width: 50,
        child: Stack(
          children: [
            CircleAvatar(
              radius: 25,
              child: Image.asset("assets/thar.jpeg"),
              backgroundColor: Colors.transparent,
            ),
            contact.select?Positioned(
              bottom: 5,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.teal,
                radius: 11,
                child: Icon(Icons.check,color: Colors.white,size: 18,)),
            ):Container(),
          ],
        ),
      ),
      title: Text(contact.name,style: TextStyle(fontSize: 15),),
      subtitle: Text(contact.status),
    );
  }
}
