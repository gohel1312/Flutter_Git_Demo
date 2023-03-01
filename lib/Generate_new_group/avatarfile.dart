//@dart=2.9
import 'package:chatapp/Staticmodel/ChatModel.dart';
import 'package:flutter/material.dart';

class AvatarCard extends StatelessWidget {
  final ChatModel contact;

  const AvatarCard({Key key, this.contact}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Stack(
            children: [
              CircleAvatar(
                radius: 25,
                child: Image.asset("assets/thar.jpeg"),
                backgroundColor: Colors.transparent,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 11,
                    child: Icon(Icons.clear,color: Colors.white,size: 12,)),
              ),
            ],
          ),
          SizedBox(height: 2,),
          Text(contact.name)
        ],
      ),
    );
  }
}
