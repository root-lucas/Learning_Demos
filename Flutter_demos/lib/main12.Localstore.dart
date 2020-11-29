import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 本地存储：基于shared_preferences实现计数器
// 即便重启软件其数据仍旧存在，相当于前端的localStorage持久化键值存储
void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: Text('shared_preferences'),
      ),
      body: _CounterWidget(),
    ),
  ));
}

class _CounterWidget extends StatefulWidget {
  _CounterWidget({Key key}) : super(key: key);

  @override
  __CounterWidgetState createState() => __CounterWidgetState();
}

class __CounterWidgetState extends State<_CounterWidget> {
  String countString = '';
  String localCount = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
              onPressed: _incrementCounter, child: Text('Increment Counter')),
          RaisedButton(onPressed: _getCounter, child: Text('Get Counter')),
          RaisedButton(onPressed: _clear, child: Text('Clear Counter')),
          Text(countString, style: TextStyle(fontSize: 20)),
          Text('result: ' + localCount, style: TextStyle(fontSize: 20)),
        ],
      ),
    );
  }

  // 增（改和增是一样的，只需要再执行一次setXXX()方法即可覆盖之前的数据）
  _incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      countString = countString + '+ 1';
    });
    int counter = ((prefs.getInt('counter')) ?? 0) + 1;
    await prefs.setInt('counter', counter);
  }

  // 查
  _getCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      localCount = prefs.getInt('counter').toString();
    });
  }

  // 删
  _clear() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove('counter'); //删除指定键
    // prefs.clear();   // 清除所有键值
  }
}
