import 'package:chat_app_ui/models/message.dart';
import 'package:flutter/material.dart';
import 'package:chat_app_ui/models/user.dart';

class ChatScreen extends StatefulWidget {
  final User user;

  ChatScreen({this.user});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  _buildMessage(Message message, bool isMe) {
    final Container msg = Container(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      width: MediaQuery.of(context).size.width * 0.75,
      margin: isMe
          ? EdgeInsets.only(top: 8.0, bottom: 8.0, left: 80.0)
          : EdgeInsets.only(top: 8.0, bottom: 8.0),
      color: isMe ? Colors.blue : Colors.grey,
      child: Text(message.text),
    );
    if (isMe) {
      return msg;
    }
    return Row(
      children: <Widget>[
        msg,
        IconButton(
            icon: message.isLiked
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: () {})
      ],
    );
  }

  _buildMessageComposer() {
    return Container(
      color: Colors.white,
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.photo)),
          Expanded(child: TextField(
            decoration: InputDecoration.collapsed(hintText: 'Send a Message'),
          )),
          IconButton(icon: Icon(Icons.send))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          widget.user.name,
        ),
        centerTitle: true,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back),
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz), onPressed: () {})
        ],
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                  padding: EdgeInsets.only(top: 10, left: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(35.0),
                          topLeft: Radius.circular(35.0)),
                      color: Colors.white),
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(35.0),
                        topLeft: Radius.circular(35.0)),
                    child: ListView.builder(
                        reverse: true,
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          bool isMe =
                              messages[index].sender.id == currentUser.id;
                          return _buildMessage(messages[index], isMe);
                        }),
                  )),
            ),
            _buildMessageComposer()
          ],
        ),
      ),
    );
  }
}
