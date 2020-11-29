import 'package:flutter/material.dart';

// 路由跳转，俩种路由跳转的方式
// Navigator.pushNamed 跳转到路由表，通过路由名打开
// Navigator.push 跳转到页面脚手架类

/*
A页面通过pushNamed跳转路由B页面传参
onPressed: (){
    Future result = Navigator.of(context).pushNamed('/Detail',arguments: '通过pushName从HomePage跳转过来的');
    // 这里是B页面传参回来的值：从DetailPage返回回来的数据
    result.then((value){
      //  value就是DetailPage返回时携带的数据
    });
},

B页面接收A页面传参的值
final message = ModalRoute.of(context).settings.arguments;
message 值为：通过pushName从HomePage跳转过来的

Navigator.of(context).pop('从DetailPage返回回来的数据');
*/
void main() => runApp(new MyApp());

/// 作为整个界面的容器
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '路由专递参数',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: '带参数跳转'),
      // 路由表设置
      routes: {
        "/nameRoute": (BuildContext context) => new SecondPage(),
      },
    );
  }
}

/// 新建一个界面
class MyHomePage extends StatefulWidget {
  // 类的构造器，用来接收传递的值
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title; // 用来储存传递过来的值

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String values1 = "root";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            new RaisedButton(
                onPressed: () {
                  // 路由跳转到第二页
                  Navigator.pushNamed(context, "/nameRoute");
                },
                child: new Text("直接使用name跳转")),
            new FlatButton(
                onPressed: () {
                  Navigator.push<String>(context,
                      MaterialPageRoute(builder: (BuildContext context) {
                    return new ThirdPage(title: "请输入昵称1");

                    /// 跳转到第三页，并且传递参数过去
                  })).then((String result) {
                    setState(() {
                      values1 = result;
                    });
                    // 接收返回值的逻辑处理，通过一个 Dialog 展示出来
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return new AlertDialog(
                            content: new Text("您输入的昵称为:$result"),
                          );
                        });
                  });
                },
                child: new Text("跳转传参并返回值")),
            Text(values1 != null ? values1 : 'root')
          ],
        ),
      ),
    );
  }
}

/// 第二个界面
/// 仅仅用于展示出界面
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("第二页"),
      ),
      body: new Center(
        child: new FlatButton(
            onPressed: () {
              // 点击的时候，返回到上一个页面中
              Navigator.pop(context);
            },
            child: new Text("返回")),
      ),
    );
  }
}

/// 第三个界面
class ThirdPage extends StatefulWidget {
  final String title; // 储存传递过来的参数
  ThirdPage({this.title}); // 本页面的构造器，接收传递过来的参数

  @override
  State<StatefulWidget> createState() {
    return new _ThirdPageState();
  }
}

class _ThirdPageState extends State<ThirdPage> {
  TextEditingController controller;

  @override
  void initState() {
    controller = new TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new Column(
        children: <Widget>[
          // 文字输入框
          new TextField(
            decoration: new InputDecoration(labelText: "请输入昵称"),
            controller: controller,
          ),

          // 确认按钮
          new RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                // 点击确认按钮

                if (controller.text == '') {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => new AlertDialog(title: new Text("请输入昵称")));
                  return;
                }
                // 将输入的内容返回
                Navigator.pop(context, controller.text);
              },
              child: new Text("确认"))
        ],
      ),
    );
  }
}
