import 'package:flui/flui.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return DetailPageState();
  }
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: FLAppBarTitle(
          title: "Detail",
        ),
      ),
    );
  }
}
