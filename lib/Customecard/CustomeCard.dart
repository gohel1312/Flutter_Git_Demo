//@dart=2.9
import 'package:chatapp/IndividualPages/PagesIndevidual.dart';
import 'package:chatapp/Staticmodel/ChatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomeCard extends StatelessWidget
{
  final ChatModel chatModel;

  const CustomeCard({Key key, this.chatModel}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder : (context)=>IndividualPages(chatModel: chatModel,)));
      },
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset(chatModel.isGroup ? "assets/Bapu.jpeg":"assets/Bapu.jpeg"),
        ),
        title: Text(chatModel.name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
        subtitle: Row(
          children: [
            Icon(Icons.done_all),
            SizedBox(width: 3,),
            Text(chatModel.currentmessage,style: TextStyle(fontSize: 12),),
            Divider()
          ],
        ),
        trailing: Text(chatModel.time),
      ),
    );
  }
}
