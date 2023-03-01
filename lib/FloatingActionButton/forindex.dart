//@dart=2.9
import 'package:chatapp/Generate_new_group/New_group.dart';
import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget
{
  final String name;
  final IconData icon;

  const ButtonCard({Key key, this.name, this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context)
  {
    return ListTile(
      leading: CircleAvatar(
        radius: 25,
        child: Icon(icon),
      ),
      title: Text(name,style: TextStyle(fontSize: 15),),
    );
  }
}
