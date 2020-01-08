import 'package:flui/flui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/DetailPage.dart';
import '../network/manager.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _results = [];

  @override
  void initState() {
    super.initState();
    NetworkManager.getInstance()
        .fetchMainData()
        .then((val) => {
              setState(() {
                _results = val["subjects"] ?? [];
              })
            })
        .catchError((e) => {print(e)});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: FLAppBarTitle(title: "Top 250"),
        ),
        backgroundColor: Color(0xfff0f0f0),
        body: ListView.builder(
            itemCount: _results.length,
            itemBuilder: (BuildContext context, int index) {
              Map item = _results[index];
              return GestureDetector(
                  onTap: () => {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (_) {
                          return DetailPage(item);
                        }))
                      },
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    height: 100,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(left: 10, right: 10),
                            child: Image.network(
                              item["images"]["medium"] ?? "",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            )),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                                padding: EdgeInsets.only(top: 8),
                                child: Text(
                                  item["title"] ?? "",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 22),
                                )),
                            Padding(
                                padding: EdgeInsets.only(top: 4),
                                child: Text(
                                  item["original_title"] ?? "",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 16),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ));
            }));
  }
}
