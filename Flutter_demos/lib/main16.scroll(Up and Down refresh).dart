import 'package:flutter/material.dart';

// 滚动列表：垂直，同时存在上拉刷新与下拉加载更多实例

// 实现：为了给列表添加上加载更多的功能，我们可以借助ScrollController，列表支持
// controller 参数，通过 ScrollController 监听列表滚动的位置，来实现加载更多的功能

void main() => runApp(MyApp());

List<String> cityNames = [
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
  '温州',
  '湖南'
];

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ScrollController _scrollController = ScrollController();

  // 生命周期开始
  @override
  void initState() {
    _scrollController.addListener(() {
      // 如果上拉滚动位置等于最大可滚动位置则加载更多数据
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _loadData();
      }
    });

    // TODO: implement initState
    super.initState();
  }

  // 生命周期结束
  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = '高级功能列表下拉刷新与上拉加载更多功能实现';

    return MaterialApp(
        title: title,
        home: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: RefreshIndicator(
              onRefresh: _handleRefresh,
              child: ListView(
                controller: _scrollController,
                children: _buildList(),
              ),
            )));
  }

  _loadData() async {
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {
      List<String> list = List<String>.from(cityNames);  // 复制一份数组
      list.addAll(cityNames);
      cityNames = list;
    });
  }

  Future<Null> _handleRefresh() async {
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      cityNames = cityNames.reversed.toList(); // 下拉刷新后数组（城市）取反
    });

    return null;
  }

  List<Widget> _buildList() {
    return cityNames.map((city) => _item(city)).toList();
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
