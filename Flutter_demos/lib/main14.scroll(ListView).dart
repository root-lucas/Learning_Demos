import 'package:flutter/material.dart';

// 滚动列表：水平垂直

void main() => runApp(MyApp());

const CITY_NAMES = [
  '北京',
  '上海',
  '广州',
  '深圳',
  '杭州',
  '苏州',
  '成都',
  '武汉',
  '郑州',
  '南宁',
  '贵州',
  '三亚',
  '香港',
  '澳门',
  '珠海',
];

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: '垂直滚动列表',
        home: Scaffold(
            appBar: AppBar(
              title: Text('ListView演示'),
            ),
            body: ListView(
              // scrollDirection: Axis.horizontal, // 滚动方向
              children: _buildList(),
            )));
  }

  List<Widget> _buildList() {
    return CITY_NAMES.map((city) => _item(city)).toList();
  }

  Widget _item(String city) {
    return Container(
      height: 80,
      margin: EdgeInsets.only(bottom: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(color: Colors.teal),
      child: Text(
        city,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }
}
