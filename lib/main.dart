import 'package:flutter/material.dart';
import 'request.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _results = [];

  @override
  Widget build(BuildContext context) {
    Request.get("/data/福利/100/1", {}).then((val) => {
          setState(() {
            _results = val["results"];
          })
        });
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: _results.length,
            itemBuilder: (BuildContext context, int index) {
              var item = _results[index];
              return Container(
                height: 100,
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image.network(
                      item["url"],
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            item["who"] ?? "",
                            style: TextStyle(fontSize: 22),
                          ),
                          Padding(
                            child: Text(
                              item["publishedAt"] ?? "",
                              style: TextStyle(fontSize: 16),
                            ),
                            padding: EdgeInsets.all(8.0),
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(8.0),
                    )
                  ],
                ),
              );
            }));
  }
}
