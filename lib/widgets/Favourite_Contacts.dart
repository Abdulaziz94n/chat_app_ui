import 'package:chat_app_ui/models/message.dart';
import 'package:chat_app_ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class FavouriteContacts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding:  EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Favourite Contacts',
                    style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.0,
                        color: Colors.blueGrey),
                  ),
                  IconButton(
                      icon: Icon(
                        Icons.more_horiz,
                        color: Colors.blueGrey,
                      ),
                      onPressed: () {})
                ],
              ),
            ),
            Container(
                height: 120,
                color: Colors.white,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                    itemCount: favorites.length,
                    itemBuilder: (context, int index) {
                      final Message chat = chats[index];
                      return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ChatScreen(
                                  user: chat.sender,
                                ))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              CircleAvatar(
                                radius: 35.0,
                                backgroundImage: AssetImage(favorites[index].imageUrl),
                              ),
                              SizedBox(height: 10),
                              Text(favorites[index].name , style: TextStyle(letterSpacing: 1.0 , color: Colors.blueGrey),)
                            ],
                          ),
                        ),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
