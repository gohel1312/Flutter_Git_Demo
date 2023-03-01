//@dart=2.9
import 'package:chatapp/FloatingActionButton/contactCard.dart';
import 'package:chatapp/Generate_new_group/avatarfile.dart';
import 'package:chatapp/Staticmodel/ChatModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateGroup extends StatefulWidget
{
  @override
  _CreateGroupState createState() => _CreateGroupState();
}

class _CreateGroupState extends State<CreateGroup>
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
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
    ChatModel(name: "White Devil", status: "Instagram Id"),
  ];
  List<ChatModel> groups =[];
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("New Group",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("Add participants",style: TextStyle(fontSize:13),)
            ],
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
          ],
        ),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: contacts.length+1,
              itemBuilder: (BuildContext context,int index){
                if(index==0)
                  {
                    return Container(
                      height: groups.length>0?90:10,
                    );
                  }
                return InkWell(
                  onTap: (){
                    if(contacts[index-1].select==true){
                      setState(() {
                        contacts[index-1].select=false;
                        groups.remove(contacts[index-1]);
                      });
                    }
                    else
                      {
                        setState(() {
                          contacts[index-1].select=true;
                          groups.add(contacts[index-1]);
                        });
                      }
                  },
                  child: ContactCard(contact: contacts[index-1],));
              },
            ),
            groups.length>0?Column(
              children: [
                Container(
                  height: 80,
                  color: Colors.white,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount:contacts.length,
                    itemBuilder:(BuildContext context,int index)
                    {
                      if(contacts[index].select==true)
                        {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                groups.remove(contacts[index]);
                                contacts[index].select = false;
                              });
                            },
                            child: AvatarCard(contact: contacts[index]));
                          }
                      else
                        {
                          return Container();
                        }
                    }),
                ),
                Divider(thickness: 2,)
              ],
            ):Container(),
          ],
        ),
      ),
    );
  }
}
