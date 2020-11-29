import 'package:flutter/material.dart';

// 路由跳转测试：新建路由（非注册路由）
void main() {
  runApp(new MaterialApp(
    title: 'myApp',
    home: new Home(),
  ));
}

// 第一页
class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('first page'),
      ),
      body: Center(
        // margin: const EdgeInsets.only(top: 100),
        child: RaisedButton(
            child: Text('跳转得到第二页'),
            onPressed: () {
              Navigator.push(
                //1
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            }),
      ),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _index,
          onTap: (newIndex) {
            setState(() {
              _index = newIndex;
            });
          },
          type: BottomNavigationBarType.fixed,
          items: [
            new BottomNavigationBarItem(label: '微信1', icon: Icon(Icons.email)),
            new BottomNavigationBarItem(label: '微信2', icon: Icon(Icons.email)),
            new BottomNavigationBarItem(label: '微信3', icon: Icon(Icons.email)),
          ]),
    );
  }
}

// 第二页
class SecondPage extends StatefulWidget {
  SecondPage({Key key}) : super(key: key);

  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  @override
  Widget build(BuildContext context) {
    int _index = 0;
    return Scaffold(
      appBar: AppBar(
        title: Text('second page'),
      ),
      body: Center(
        // margin: const EdgeInsets.only(top: 100),
        child: RaisedButton(
            child: Text('返回第一页'),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      bottomNavigationBar: new BottomNavigationBar(
          currentIndex: _index,
          onTap: (newIndex) {
            setState(() {
              _index = newIndex;
            });
          },
          items: [
            new BottomNavigationBarItem(label: '微信4', icon: Icon(Icons.email)),
            new BottomNavigationBarItem(label: '微信5', icon: Icon(Icons.email)),
            new BottomNavigationBarItem(label: '微信6', icon: Icon(Icons.email)),
          ]),
    );
  }
}
