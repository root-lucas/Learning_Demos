import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// 网络请求封装、JSON转Dart

void main() => runApp(new Myapp());

class Myapp extends StatefulWidget {
  // Myapp({Key key}) : super(key: key);

  @override
  _MyappState createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  String showResult = '';

  Future<CommonModel> fetchPost() async {
    final response =
        await http.get('http://www.devio.org/io/flutter_app/json/test_common_model.json');

    Utf8Decoder utf8decoder = Utf8Decoder(); // 解决中文乱码问题
    var result = json.decode(utf8decoder.convert(response.bodyBytes));
    return CommonModel.fromJson(result);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('Future与FutureBuilder实用技巧')),
            body: Center(
                child: Container(
              // width: 200,
              height: 100,
              child: FutureBuilder<CommonModel>(
                  future: fetchPost(),
                  builder: (BuildContext context, AsyncSnapshot snapshot)  {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return new Text('Input a URL to Start');
                      case ConnectionState.waiting:
                        return new Center(child: new CircularProgressIndicator());
                      case ConnectionState.active:
                        return new Text('active');
                      case ConnectionState.done:
                        if (snapshot.hasError) {
                          return new Text(
                            '${snapshot.error}',
                            style: TextStyle(color: Colors.red),
                          );
                        } else {
                          return new Column(children: <Widget>[
                            Text('icon:${snapshot.data.icon}'),
                            Text('statusBarColor:${snapshot.data.statusBarColor}'),
                            Text('title:${snapshot.data.title}'),
                            Text('url:${snapshot.data.url}'),
                          ]);
                        }
                    }
                  }),
            ))));
  }
}

class CommonModel {
  final String icon;
  final String title;
  final String url;
  final String statusBarColor;
  final bool hideAppBar;

  CommonModel({this.icon, this.title, this.url, this.statusBarColor, this.hideAppBar});

  factory CommonModel.fromJson(Map<String, dynamic> json) {
    return CommonModel(
      icon: json['icon'],
      title: json['title'],
      url: json['url'],
      statusBarColor: json['statusBarColor'],
      hideAppBar: json['hideAppBar'],
    );
  }
}
