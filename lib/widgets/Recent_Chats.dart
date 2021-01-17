import 'package:chat_app_ui/models/message.dart';
import 'package:chat_app_ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class RecentChats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              //Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
            child: ListView.builder(
        itemCount: chats.length,
        itemBuilder: (context, int index) {
            final Message chat = chats[index];
            return GestureDetector(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ChatScreen(
                            user: chat.sender,
                          ))),
              child: Container(
                margin: EdgeInsets.only(top: 5.0, bottom: 5.0, right: 20 ),
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                decoration: BoxDecoration(
                    color: chat.unread ? Color(0xFFFFEFEE) : Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35.0,
                          backgroundImage:
                              AssetImage(chats[index].sender.imageUrl),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(chat.sender.name),
                            Container(
                                width: MediaQuery.of(context).size.width * 0.45,
                                child: Text(chat.text))
                          ],
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          chat.time,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        chat.unread
                            ? Container(
                                width: 40,
                                height: 20,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(35.0),
                                ),
                                child: Text(
                                  'NEW',
                                  style: TextStyle(color: Colors.white),
                                ),
                                alignment: Alignment.center,
                              )
                            : Text(''),
                      ],
                    ),
                  ],
                ),
              ),
            );
        },
      ),
          ),
    ));
  }
}
