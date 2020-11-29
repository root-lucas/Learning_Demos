import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // 用来测试隐藏顶部状态栏的

// 此次实现方式不常用：可参考 https://www.cnblogs.com/chichung/p/12012689.html
// TabBarView
void main() {
  runApp(MaterialApp(
    title: "TabBarWidget",
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 6);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //显示底部栏(隐藏顶部电池信号时间状态栏)
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    //显示顶部电池信号时间栏(隐藏底部栏)
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    //隐藏底部栏和顶部状态栏
    // SystemChrome.setEnabledSystemUIOverlays([]);
    return Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.red,
          title: Text("顶部Tab切换"),
          centerTitle: true,
          // 如果下面使用了抽屉菜单,后续不需要修改图标的情况下这里leading最好不好设置了
          // leadingleading: Builder(builder: (context) {
          //   return IconButton(
          //     icon: Icon(Icons.dashboard, color: Colors.white), //自定义图标
          //     onPressed: () {
          //       // 打开抽屉菜单
          //       Scaffold.of(context).openDrawer();
          //     },
          //   );
          // }),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, 'search');
                },
                child: Icon(
                  Icons.search,
                ),
              ),
            )
          ],
          bottom: TabBar(
            // isScrollable: true, // 如果Tabbar长度过长挤压文字空间，则滚动，默认为false
            controller: _tabController, // 记得要带上tabController
            tabs: <Widget>[
              Tab(text: "热门"),
              Tab(text: "推荐"),
              Tab(text: "关注"),
              Tab(text: "收藏"),
              Tab(text: "新增"),
              Tab(text: "点赞"),
            ],
          ),
        ),
        drawer: new MyDrawer(),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Center(child: Text("这是热门的内容")),
            Center(child: Text("这是推荐的内容")),
            Center(child: Text("这是关注的内容")),
            Center(child: Text("这是收藏的内容")),
            Center(child: Text("这是新增的内容")),
            Center(child: Text("这是点赞的内容"))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.white,
            size: 30,
          ),
          onPressed: () {
            print('FloatingActionButton');
          },
          backgroundColor: Colors.blue,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          color: Colors.white,
          shape: CircularNotchedRectangle(), // 底部导航栏打一个圆形的洞
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, //均分底部导航栏横向空间
            children: [
              IconButton(icon: Icon(Icons.home), onPressed: () {}),
              SizedBox(), //中间位置空出
              IconButton(icon: Icon(Icons.business), onPressed: () {}),
            ],
          ),
        ));
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
