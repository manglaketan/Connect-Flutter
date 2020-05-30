import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smit/services/loading.dart';
import 'custom_widgets.dart';

class Search_Page extends StatefulWidget {
  @override
  _Search_PageState createState() => _Search_PageState();
}

class _Search_PageState extends State<Search_Page> {
  CollectionReference ref = Firestore.instance.collection("Users");

  Future search(String value) async {
    QuerySnapshot snapshot =
        await ref.where("combined", arrayContains: value).getDocuments();
    if (snapshot.documents.isEmpty) {
      setState(() {
        success = false;
        return null;
      });
    } else {
      for (var a in snapshot.documents) {
        Result temp = Result(a);
        result.add(temp);
      }
      setState(() {
        success = true;
      });
    }
  }

  bool success = false;
  bool load = false;
  List<Result> result = List<Result>();
  TextEditingController searching = TextEditingController();

  Widget build(BuildContext context) {
    double _screenheight = MediaQuery.of(context).size.height;
    double _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: myblue,
          title: Text(
            "Search Your People",
            style: TextStyle(
                color: Colors.white,
                fontFamily: "Poppins",
                fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
                height: _screenheight * 0.09,
                padding: EdgeInsets.only(left: 3.0, right: 3.0, top: 8.0),
                color: Color.fromRGBO(247, 127, 0, 0.4),
                child: Row(
                  children: <Widget>[
                    IconButton(
                      onPressed: ()=>print("Filtering"),
                      padding: EdgeInsets.all(0),
                      iconSize: 30.0,
                      icon: Icon(
                        Icons.filter_list,
                        color: myblue,
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searching,
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w500,
                            color: myblue,
                            fontSize: 20.0),
                        cursorColor: myblue,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Your Favorite People Here",
                          hintStyle: TextStyle(
                              color: Color.fromRGBO(0, 48, 73, 0.5),
                              fontFamily: "Poppins",
                              fontWeight: FontWeight.w500,
                              fontSize: 20.0),
                        ),
                      ),
                    ),
                    IconButton(
                      padding: EdgeInsets.all(0),
                      iconSize: 30.0,
                      icon: Icon(
                        Icons.search,
                        color: myblue,
                      ),
                      onPressed: () async {
                        setState(() {
                          load = true;
                        });
                        await search(searching.text);
                        setState(() {
                          load = false;
                        });
                      },
                    ),
                  ],
                )),
            load
                ? Loading()
                : Container(
                    height: 1,
                    width: 1.0,
                  ),
            success
                ? Expanded(
                    child: ListView.builder(
                        itemCount: result.length,
                        itemBuilder: (context, index) {
                          return Search_Item(
                            name: result[index].name,
                            description: result[index].description,
                            imagepath: result[index].imagepath,
                          );
                        }),
                  )
                : Container()
          ],
        ));
  }
}

class Result {
  String name;
  String description = "";
  String imagepath;

  Result(DocumentSnapshot doc) {
    name = doc.data['name'];
    imagepath = 'images/landscape3.png';
    for (var a in doc.data['skills']) {
      description = (description + a.toString() + ', ');
    }
  }
}
