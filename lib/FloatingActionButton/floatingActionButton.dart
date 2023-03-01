//@dart=2.9
import 'package:chatapp/FloatingActionButton/contactCard.dart';
import 'package:chatapp/FloatingActionButton/forindex.dart';
import 'package:chatapp/Generate_new_group/New_group.dart';
import 'package:chatapp/Staticmodel/ChatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectContact extends StatefulWidget
{
  @override
  State<SelectContact> createState() => _SelectContactState();
}

class _SelectContactState extends State<SelectContact>
{
  List<ChatModel> contacts =[
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "Black Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "Father Of Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "Danger Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
  ];
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Select Contact",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("200 Contacts",style: TextStyle(fontSize:13),)
            ],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            PopupMenuButton(
                onSelected: (value){
                  print(value);
                },
                itemBuilder: (BuildContext context){
                  return [
                    PopupMenuItem(child: Text("New Group"),value: "New Group",),
                    PopupMenuItem(child: Text("New Broadcast"),value: "New Broadcast",),
                    PopupMenuItem(child: Text("WhatsApp Web"),value: "WhatsApp Web",),
                    PopupMenuItem(child: Text("Setting"),value: "Setting",),
                  ];
                })
          ],
        ),
        body: ListView.builder(
          itemCount: contacts.length+2,
          itemBuilder: (BuildContext context,int index){
            if(index==-0){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CreateGroup()));
                },
                child: ButtonCard(icon: Icons.group,name: "New group",));
            }
            else if(index==1){
              return ButtonCard(icon: Icons.person_add,name: "New Contact che ho",);
            }
            return ContactCard(contact: contacts[index-2],);
          },
        ),
      ),
    );
  }
}
