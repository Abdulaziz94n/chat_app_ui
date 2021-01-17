import 'package:chat_app_ui/models/message.dart';
import 'package:chat_app_ui/widgets/Favourite_Contacts.dart';
import 'package:chat_app_ui/widgets/Recent_Chats.dart';
import 'package:chat_app_ui/widgets/category_selector.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: AppBar(
          elevation: 0,
          title: Text(
            'Chats',
            style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.search, size: 30.0),
                color: Colors.white,
                onPressed: () {})
          ],
        ),
        body: Column(
          children: <Widget>[
            CategorySelector(),
            Expanded(
              child: Container(
                //height: 500.0,
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor, //Theme.of(context).accentColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0))),
                child: Column(
                  children: <Widget>[FavouriteContacts(), RecentChats()],
                ),
              ),
            )
          ],
        ));
  }
}
