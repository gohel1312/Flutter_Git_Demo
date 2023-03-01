//@dart=2.9
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ChatScreen.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal.shade800,
            title: Text("WhatsApp clone"),
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
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorColor: Colors.white,
              tabs: [
                Icon(Icons.camera_alt_outlined),
                Text("CHATS"),
                Text("STATUS"),
                Text("CALL")
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ChatScreen(),
              ChatScreen(),
              ChatScreen(),
              ChatScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
