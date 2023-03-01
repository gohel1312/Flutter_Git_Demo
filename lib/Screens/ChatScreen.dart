//@dart=2.9
import 'package:chatapp/FloatingActionButton/floatingActionButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../Customecard/CustomeCard.dart';
import '../Staticmodel/ChatModel.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen>
{
  List<ChatModel> chats =[
    ChatModel(
      name: "Papa",
      isGroup: false,
      currentmessage: "Ghar Bhego Tha",
      time: DateFormat("HH:mm").format(DateTime.now()),
      icon: "Bapu.jpeg"
    ),
    ChatModel(
        name: "Maa",
        isGroup: false,
        currentmessage: "Ketlivar",
        time: DateFormat("HH:mm").format(DateTime.now()),
        icon: "Bapu.jpeg"
    ),
    ChatModel(
        name: "Kartik",
        isGroup: false,
        currentmessage: "Pate aav",
        time: DateFormat("HH:mm").format(DateTime.now()),
        icon: "Bapu.jpeg"
    ),
    ChatModel(
        name: "Anmol",
        isGroup: false,
        currentmessage: "PDF ni zerox karavto aavje",
        time: DateFormat("HH:mm").format(DateTime.now()),
        icon: "Bapu.jpeg"
    ),
    ChatModel(
        name: "Shivam",
        isGroup: false,
        currentmessage: "Vakil sir",
        time: DateFormat("HH:mm").format(DateTime.now()),
        icon: "Bapu.jpeg"
    ),
    ChatModel(
        name: "Bhai",
        isGroup: false,
        currentmessage: "Setting Karavidene ",
        time: DateFormat("HH:mm").format(DateTime.now()),
        icon: "Bapu.jpeg"
    ),
  ];
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
        child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SelectContact()));
            },
            elevation: 10,
            backgroundColor: Colors.teal.shade800,
            child: Icon(Icons.chat,color: Colors.white,),
          ),
          body: ListView.builder(
            itemCount: chats.length,
            itemBuilder: (BuildContext context,int index){
              return CustomeCard(chatModel: chats[index]);
            },
          ),
        ),
    );
  }
}
