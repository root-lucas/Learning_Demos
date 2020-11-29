import 'package:flutter/material.dart';

// 展示大量列表项，推荐使用ListView.builder(非预加载)，如果只是简单的文字图片只需要下面注释即可：
// body: ListView(
//   children: <Widget>[
//     ListTile(
//       leading: Icon(Icons.access_time),
//       title: Text('第1行'),
//     ),
//     ListTile(
//       leading: Icon(Icons.access_time),
//       title: Text('第2行'),
//     ),
//   ],
// ),

void main() => runApp(MyApp(
      items: new List<String>.generate(300, (i) => "第$i行"), //1
    ));

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({@required this.items});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      home: Scaffold(
        appBar: AppBar(
          title: Text('ListView示例'),
        ),
        // ListView.separated 只比ListView.builder多了一个分栏符而已
        body: ListView.separated(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Icon(Icons.access_time),
              title: Text('${items[index]}'),
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return index % 2 == 0 ? Divider(color: Colors.blue) : Divider(color: Colors.red);
          },
        ),
      ),
    );
  }
}
