import 'package:flutter/material.dart';

// 数据共享（InheritedWidget）的使用
// 俩个StatefulWidget组件之间进行数据共享
// 本示例主要是为了演示InheritedWidget的功能特性，并不是计数器的推荐实现方式。
// 根widget中通过InheritedWidget共享了一个数据,那么我们便可以在任意子widget中来获取该共享的数据！
// InheritedWidget数据发生变化时，可以自动更新依赖的子孙组件
void main() {
  runApp(MaterialApp(
    title: "TabBarWidget",
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: InheritedWidgetTestRoute());
  }
}

// 共享数据的中间件,数据保存的地方
class ShareDataWidget extends InheritedWidget {
  ShareDataWidget({@required this.data, this.child}) : super(child: child);

  final int data; //需要在子树中共享的数据，保存点击次数
  final Widget child;

  //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>(); // 注册依赖关系
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget
  @override
  bool updateShouldNotify(ShareDataWidget old) {
    //如果返回true，则子树中依赖(build函数中有调用)本widget
    //的子widget的`state.didChangeDependencies`会被调用
    return old.data != data;
  }
}

// 第二个组件类
class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => new __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    // 使用InheritedWidget中的共享数据
    // 如果_TestWidget的build方法中没有使用ShareDataWidget的数据，
    // 那么它的didChangeDependencies()将不会被调用，因为它并没有依赖ShareDataWidget
    return Text(
      ShareDataWidget.of(context).data.toString(),
      style: TextStyle(color: Colors.red),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

// 第一个组件类
class InheritedWidgetTestRoute extends StatefulWidget {
  @override
  _InheritedWidgetTestRouteState createState() => new _InheritedWidgetTestRouteState();
}

class _InheritedWidgetTestRouteState extends State<InheritedWidgetTestRoute> {
  int count = 110;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
        //使用ShareDataWidget
        data: count,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: _TestWidget(), //子widget中依赖ShareDataWidget
            ),
            RaisedButton(
              child: Text("Increment"),
              //每点击一次，将count自增，然后重新build,ShareDataWidget的data将被更新
              onPressed: () => setState(() => ++count),
            )
          ],
        ),
      ),
    );
  }
}
