//@dart=2.9
import 'package:chatapp/Customecard/CustomeCard.dart';
import 'package:chatapp/Staticmodel/ChatModel.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class IndividualPages extends StatefulWidget
{
  final ChatModel chatModel;

  const IndividualPages({Key key, this.chatModel}) : super(key: key); // create instance of chatmodel

  @override
  State<IndividualPages> createState() => _IndividualPagesState();
}

class _IndividualPagesState extends State<IndividualPages>
{
  bool show = false;
  TextEditingController _emoji = TextEditingController();
  FocusNode focusNode = FocusNode();
  @override
  void dispose() {
    _emoji.dispose();
    super.dispose();
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    focusNode.addListener(() {
      if(focusNode.hasFocus){
        setState(() {
          show = false;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context)
  {
    return SafeArea(
      child: Scaffold(
        //backgroundColor: Colors.teal,
        appBar: AppBar(
          backgroundColor: Colors.amber,
          leadingWidth: 70,
          leading: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomeCard()));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.arrow_back,size: 25,),
                CircleAvatar(
                  child: Image.asset(widget.chatModel.isGroup ? "assets/Bapu.jpeg":"assets/Bapu.jpeg"),
                ),
              ],
            ),
          ),
          title: InkWell(
            onTap: (){},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(widget.chatModel.name),
                Text("Last seen today at "+widget.chatModel.time,style: TextStyle(fontSize: 10),)
              ],
            ),
          ),
          actions: [
            IconButton(onPressed: (){}, icon: Icon(Icons.videocam)),
            IconButton(onPressed: (){}, icon: Icon(Icons.call)),
            PopupMenuButton(
              itemBuilder: (context) {
               return[
                 PopupMenuItem(child: Text("New Group"),value: "New Group",),
                 PopupMenuItem(child: Text("New Broadcast"),value: "New Broadcast",),
                 PopupMenuItem(child: Text("WhatsApp Web"),value: "WhatsApp Web",),
                 PopupMenuItem(child: Text("Setting"),value: "Setting",),
               ];
              }
              ,)
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WillPopScope(
            child: Stack(
              children: [
                ListView(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width-60,
                            child: Row(
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  child: IconButton(
                                    onPressed: (){
                                      setState(() {
                                        focusNode.unfocus();
                                        focusNode.canRequestFocus = false;
                                        show = !show;
                                      });
                                    },
                                    icon: Icon(Icons.emoji_emotions,color: Colors.grey,),
                                  ),
                                ),
                                Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                                      child: TextFormField(
                                        controller: _emoji,
                                        textAlignVertical: TextAlignVertical.center,
                                        keyboardType: TextInputType.multiline,
                                        maxLines: 5,
                                        minLines: 1,
                                        focusNode: focusNode,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Type a Message",
                                          contentPadding: EdgeInsets.only(left: 15,bottom: 8,top: 8,right: 15),
                                          suffixIcon: Row(
                                            mainAxisSize: MainAxisSize.min,
                                              children: [
                                              IconButton(onPressed: (){
                                                showModalBottomSheet(
                                                  backgroundColor: Colors.transparent,
                                                    context: context,
                                                    builder: (context){
                                                    return bottomsheet();
                                                  });
                                              }, icon: Icon(Icons.attach_file)),
                                              IconButton(onPressed: (){}, icon: Icon(Icons.camera_alt))
                                            ],
                                          )
                                        ),
                                      ),
                                    ),
                                  )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8,right: 5,),
                            child: CircleAvatar(
                              backgroundColor: Colors.black,
                              child: IconButton(onPressed: (){},icon: Icon(Icons.mic,color: Colors.white,)),
                            ),
                          )
                        ],
                      ),
                      show ? emojiSelecter() : Container(),
                    ],
                  ),
                )
              ],
            ),
            onWillPop: (){
              if(show){
                setState(() {
                  show = false;
                }
                );
              }
              else
                {
                  Navigator.pop(context);
                }
              return Future.value(false);
            },
          ),
        ),
      ),
    );
  }

  Widget bottomsheet(){
    return Container(
      height: 300,
      width:200 ,
      child: Card(
        margin: EdgeInsets.all(18),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.headset, Colors.blue, "Audio"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.camera_alt, Colors.orange, "Pick"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.insert_photo, Colors.pink, "Gallery"),
                ],
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconcreation(Icons.insert_drive_file, Colors.blue, "Document"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.location_pin, Colors.orange, "Location"),
                  SizedBox(width: 40,),
                  iconcreation(Icons.person, Colors.pink, "Contact"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget iconcreation(IconData icon,Color color,String text)
  {
    return InkWell(
      onTap: (){},
      child: Column(
        children: [
          CircleAvatar(
            radius: 25,
            backgroundColor: color,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5,),
          Text(text)
        ],
      ),
    );
  }

  Widget emojiSelecter()
  {
    return Offstage(
      offstage: !show,
      child: SizedBox(
        height: 340,
        child: EmojiPicker(
          textEditingController: _emoji,
          config: Config(
            columns: 7,
            emojiSizeMax: 30,
            verticalSpacing: 5,
            horizontalSpacing: 5,
            gridPadding: EdgeInsets.zero,
            initCategory: Category.RECENT,
            bgColor: Color(0xFFF2F2F2),
            indicatorColor: Colors.blue,
            iconColor: Colors.grey,
            iconColorSelected: Colors.blue,
            backspaceColor: Colors.blue,
            skinToneDialogBgColor: Colors.white,
            skinToneIndicatorColor: Colors.grey,
            enableSkinTones: true,
            showRecentsTab: true,
            recentsLimit: 20,
            replaceEmojiOnLimitExceed: false,
            noRecents: Text("No Recents",style: TextStyle(fontSize: 20,color: Colors.black26),),
            loadingIndicator: SizedBox.shrink(),
            tabIndicatorAnimDuration: kTabScrollDuration,
            categoryIcons: CategoryIcons(),
            buttonMode: ButtonMode.MATERIAL,
            checkPlatformCompatibility: true
          ),
        ),
      ),
    );
  }
}

