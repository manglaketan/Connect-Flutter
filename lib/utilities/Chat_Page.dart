import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:smit/services/loading.dart';
import 'package:smit/services/user_database.dart';
import 'package:smit/services/users.dart';
import 'dart:ui';
import 'custom_widgets.dart';

class Chat extends StatefulWidget {
  const Chat({Key key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
//  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _firestore = Firestore.instance;

  TextEditingController messageController = TextEditingController();
  ScrollController scrollController = ScrollController();

  Future<void> callback(String name) async {
    if (messageController.text.length > 0) {
      await _firestore.collection('messages').add({
        'text': messageController.text,
        'from': name,
        'date': DateTime.now().toIso8601String().toString(),
      });
      messageController.clear();
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        curve: Curves.easeOut,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<UserData>(
        stream: DatabaseService(uid: user.uid).userdata,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Scaffold(
              body: Center(
                child: Loading(),
              ),
            );
          } else {
            UserData userData = snapshot.data;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: myblue,
                title: Text("${userData.name}"),
              ),
              body: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: StreamBuilder<QuerySnapshot>(
                      stream: _firestore
                          .collection('messages')
                          .orderBy('date')
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: Loading(),
                          );

                        List<DocumentSnapshot> docs = snapshot.data.documents;

                        List<Widget> messages = docs
                            .map((doc) => Message(
                                  from: doc.data['from'],
                                  text: doc.data['text'],
                                  me: userData.name == doc.data['from'],
                                ))
                            .toList();

                        return Padding(
                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: ListView(
                            controller: scrollController,
                            children: <Widget>[
                              ...messages,
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.09,
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(left: 3.0, right: 3.0, top: 8.0),
                      color: Color.fromRGBO(247, 127, 0, 0.4),
                      child: Row(
                        children: <Widget>[
                          IconButton(
                            icon: Icon(
                              Icons.camera_alt,
                              color: myblue,
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: messageController,
                              maxLines: null,
                              style: TextStyle(
                                  fontFamily: "Lato",
                                  color: myblue,
                                  fontSize: 20.0),
                              cursorColor: myblue,
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(bottom: 4.0),
                                border: InputBorder.none,
                                hintText: "Type Your Message Here",
                                hintStyle: TextStyle(
                                    color: Color.fromRGBO(0, 48, 73, 0.5),
                                    fontFamily: "Lato",
                                    fontWeight: FontWeight.w700,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () async => callback(userData.name),
                            icon: Icon(
                              Icons.send,
                              color: myblue,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            );
          }
        });
  }
}
