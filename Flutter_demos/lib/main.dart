import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    title: 'Test',
    home: Search(),
  ));
}

class Search extends StatefulWidget {
  @override
  SearchState createState() => new SearchState();
}

Widget selected(IconData icon, String text, String id) {
  return new PopupMenuItem<String>(
      value: id,
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          new Icon(icon, color: Colors.blue),
          new Text(text),
        ],
      ));
}

class SearchState extends State<Search> {
  FocusNode focusNode = new FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top'),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
                print('HHHHH');
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, 'search');
            },
            child: Icon(
              Icons.search,
              size: 30,
            ),
          ),
          // 隐藏的菜单
          PopupMenuButton<String>(
            // icon: Icon(Icons.menu),
            offset: Offset(10, 40),
            itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
              // 也可以使用PopupMenuEntry
              selected(Icons.message, '发起群聊', 'A'),
              selected(Icons.group_add, '添加服务', 'B'),
              selected(Icons.cast_connected, '扫一扫码', 'C'),
            ],
            onSelected: (String action) {
              print('onSelected = $action');
              // 点击选项的时候
              switch (action) {
                case 'A':
                  break;
                case 'B':
                  break;
                case 'C':
                  break;
              }
            },
          ),
        ],
      ),
      drawer: new MyDrawer(),
      body: Container(
        margin: const EdgeInsets.all(10.0),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(10.0),
              child: Text(
                '搜索指定文章',
                style: TextStyle(fontSize: 16.0, color: Color(0xffb5b5b5)),
                textDirection: TextDirection.rtl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 抽屉菜单Drawer
class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    // 也可以使用CircleAvatar组件
                    child: ClipRRect(
                      //剪裁为圆角矩形
                      borderRadius: BorderRadius.circular(5.0),
                      child: Image.network(
                          "http://www.ghost64.com/qqtupian/zixunImg/local/2017/03/09/1489037721108.jpg",
                          width: 60.0),
                    ),
                  ),
                  Text(
                    "Lucas",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
