//@dart=2.9
class ChatModel
{
  String name;
  String icon;
  bool isGroup;
  String time;
  String status;
  String currentmessage;
  bool select = false;
  ChatModel({this.name,this.icon,this.isGroup,this.time,this.status,this.currentmessage,this.select = false });
}