import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailPage extends StatelessWidget {
  Map detail;

  DetailPage(this.detail);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FLAppBarTitle(
          title: "电影",
        ),
      ),
      body: Container(
        child: ListView(children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                detail["images"]["medium"] ?? "",
                width: 80,
                height: 120,
                fit: BoxFit.cover,
              ),
              Column(
                children: <Widget>[
                  Text(
                    detail["title"],
                    style: TextStyle(fontSize: 24),
                  ),
                  Text(detail["original_title"], style: TextStyle(fontSize: 18))
                ],
              )
            ],
          )
        ]),
      ),
    );
  }
}
