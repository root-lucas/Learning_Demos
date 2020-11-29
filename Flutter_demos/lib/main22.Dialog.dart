import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // IOS风格：日历对话框2
// 三种对话框演示
// showDialog方法正是showGeneralDialog的一个封装

void main() => runApp(new MyApp());

/// 作为整个界面的容器
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '对话框演示',
      home: new MyHomePage(title: '对话框演示'),
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
              child: new Text("SimpleDialog对话框"),
              onPressed: () {
                showSimpleDialog(context); // 必须将上下文context传过去
              },
            ),
            new RaisedButton(
              child: new Text("AlterDialog对话框"),
              onPressed: () {
                showAlterDialog(context);
                // 下面为最简单的警告对话框
                // showDialog(
                //     context: context,
                //     builder: (BuildContext context) {
                //       return new AlertDialog(
                //         content: new Text("您输入的昵称为:"),
                //       );
                //     });
              },
            ),
            new RaisedButton(
              child: new Text("Dialog对话框可以使用滚动组件"),
              onPressed: () {
                showListDialog(context);
              },
            ),
            new RaisedButton(
                child: new Text("自定义对话框(背景加黑)"),
                onPressed: () {
                  showCustomDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("您确定要删除当前文件吗?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          FlatButton(
                            child: Text("删除"),
                            onPressed: () {
                              // 执行删除操作
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            new RaisedButton(
              child: Text("话框3（复选框可点击）"),
              onPressed: () async {
                //弹出删除确认对话框，等待用户确认
                bool deleteTree = await _showModalBottomSheet(context);
                if (deleteTree == null) {
                  print("取消删除");
                } else {
                  print("同时删除子目录: $deleteTree");
                }
              },
            ),
            new RaisedButton(
                child: new Text("自定义对话框(背景加黑)"),
                onPressed: () {
                  showCustomDialog<bool>(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("提示"),
                        content: Text("您确定要删除当前文件吗?"),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("取消"),
                            onPressed: () => Navigator.of(context).pop(),
                          ),
                          FlatButton(
                            child: Text("删除"),
                            onPressed: () {
                              // 执行删除操作
                              Navigator.of(context).pop(true);
                            },
                          ),
                        ],
                      );
                    },
                  );
                }),
            new RaisedButton(
                child: new Text("自定义对话框(底部半屏菜单列表)"),
                onPressed: () {
                  _showModalBottomSheet(context);
                }),
            // 调用showBottomSheet方法就必须得保证父级组件中有Scaffold
            new RaisedButton(
                child: new Text("自定义对话框(底部全屏菜单列表)"),
                onPressed: () {
                  _showBottomSheet(context);
                }),
            new RaisedButton(
                child: new Text("加载对话框"),
                onPressed: () {
                  showLoadingDialog(context);
                }),
            new RaisedButton(
                child: new Text("日历对话框1"),
                onPressed: () {
                  _showDatePicker1(context);
                }),
            new RaisedButton(
                child: new Text("日历对话框2"),
                onPressed: () {
                  _showDatePicker2(context);
                }),
          ],
        ),
      ),
    );
  }
}

// 单独封装一个内部管理选中状态的复选框组件
class DialogCheckbox extends StatefulWidget {
  DialogCheckbox({
    Key key,
    this.value,
    @required this.onChanged,
  });

  final ValueChanged<bool> onChanged;
  final bool value;

  @override
  _DialogCheckboxState createState() => _DialogCheckboxState();
}

class _DialogCheckboxState extends State<DialogCheckbox> {
  bool value;

  @override
  void initState() {
    value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: value,
      onChanged: (v) {
        //将选中状态通过事件的形式抛出
        widget.onChanged(v);
        setState(() {
          //更新自身选中状态
          value = v;
        });
      },
    );
  }
}

Future<bool> showDeleteConfirmDialog3(context) {
  bool _withTree = false; //记录复选框是否选中
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text("提示"),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("您确定要删除当前文件吗?"),
            Row(
              children: <Widget>[
                Text("同时删除子目录？"),
                DialogCheckbox(
                  value: _withTree, //默认不选中
                  onChanged: (bool value) {
                    //更新选中状态
                    _withTree = !_withTree;
                  },
                ),
              ],
            ),
          ],
        ),
        actions: <Widget>[
          FlatButton(
            child: Text("取消"),
            onPressed: () => Navigator.of(context).pop(),
          ),
          FlatButton(
            child: Text("删除"),
            onPressed: () {
              // 将选中状态返回
              Navigator.of(context).pop(_withTree);
            },
          ),
        ],
      );
    },
  );
}

// 自定义对话框(暗黑背景，动画缩放)
Future<T> showCustomDialog<T>({
  @required BuildContext context,
  bool barrierDismissible = true,
  WidgetBuilder builder,
}) {
  final ThemeData theme = Theme.of(context, shadowThemeOnly: true);
  return showGeneralDialog(
    context: context,
    pageBuilder: (BuildContext buildContext, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      final Widget pageChild = Builder(builder: builder);
      return SafeArea(
        child: Builder(builder: (BuildContext context) {
          return theme != null ? Theme(data: theme, child: pageChild) : pageChild;
        }),
      );
    },
    barrierDismissible: barrierDismissible,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black87, // 自定义遮罩颜色
    transitionDuration: const Duration(milliseconds: 150),
    transitionBuilder: _buildMaterialDialogTransitions,
  );
}

Widget _buildMaterialDialogTransitions(BuildContext context, Animation<double> animation,
    Animation<double> secondaryAnimation, Widget child) {
  // 使用缩放动画
  return ScaleTransition(
    scale: CurvedAnimation(
      parent: animation,
      curve: Curves.easeOut,
    ),
    child: child,
  );
}

// Simple对话框
Future<void> showSimpleDialog(context) async {
  int i = await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: const Text('请选择语言'),
          children: <Widget>[
            SimpleDialogOption(
              onPressed: () {
                // 返回1
                Navigator.pop(context, 1);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () {
                // 返回2
                Navigator.pop(context, 2);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: const Text('美国英语'),
              ),
            ),
          ],
        );
      });

  if (i != null) {
    print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
  }
}

// Alter对话框
Future<void> showAlterDialog(context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) => new AlertDialog(
            title: Text("提示"),
            content: Text("您确定要删除当前文件吗?"),
            actions: <Widget>[
              FlatButton(
                  child: Text("取消"),
                  onPressed: () {
                    Navigator.of(context).pop(); //关闭对话框
                    print('你点击了取消!');
                  }),
              FlatButton(
                  child: Text("确定"),
                  onPressed: () {
                    print('你点击了确定!');
                    // ... 执行删除操作
                    Navigator.of(context).pop(true); //关闭对话框
                  }),
            ],
          ));
}

// Dialog对话框,上面所有对话框都基于Dialog类
Future<void> showListDialog(context) async {
  // 将点击下标值付给index变量
  int index = await showDialog<int>(
    context: context,
    builder: (BuildContext context) {
      var child = Column(
        children: <Widget>[
          ListTile(
            title: Text("请选择"),
            trailing: GestureDetector(
              child: Icon(Icons.close),
              onTap: () => Navigator.of(context).pop(),
            ),
          ),
          Expanded(
              child: ListView.separated(
            itemCount: 30,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                trailing: Icon(Icons.keyboard_arrow_right),
                leading: Icon(Icons.event_available),
                title: Text("$index"),
                onTap: () => Navigator.of(context).pop(index),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return index % 2 == 0 ? Divider(color: Colors.blue) : Divider(color: Colors.red);
            },
          )),
        ],
      );

      //使用AlertDialog会报错
      //return AlertDialog(content: child);
      return Dialog(child: child);
    },
  );
  if (index != null) {
    print("点击了：$index");
  }
}

// 弹出底部菜单列表模态对话框
Future _showModalBottomSheet(context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () => Navigator.of(context).pop(index),
          );
        },
      );
    },
  );
}

// 返回的是一个controller
PersistentBottomSheetController<int> _showBottomSheet(context) {
  return showBottomSheet<int>(
    context: context,
    builder: (BuildContext context) {
      return ListView.builder(
        itemCount: 30,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text("$index"),
            onTap: () {
              // do something
              print("$index");
              Navigator.of(context).pop();
            },
          );
        },
      );
    },
  );
}

// 加载对话框
showLoadingDialog(context) {
  showDialog(
    context: context,
    barrierDismissible: false, //点击遮罩不关闭对话框
    builder: (context) {
      return AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              trailing: GestureDetector(
                  child: Icon(Icons.close),
                  onTap: () {
                    Navigator.of(context).pop(true);
                  }),
            ),
            CircularProgressIndicator(),
            Padding(
              padding: const EdgeInsets.only(top: 26.0),
              child: Text("正在加载，请稍后..."),
            )
          ],
        ),
      );
    },
  );
}

// 日历对话框1
Future<DateTime> _showDatePicker1(context) {
  var date = DateTime.now();
  return showDatePicker(
    context: context,
    initialDate: date,
    firstDate: date,
    lastDate: date.add(
      //未来30天可选
      Duration(days: 30),
    ),
  );
}

// 日历对话框2
Future<DateTime> _showDatePicker2(context) {
  var date = DateTime.now();
  return showCupertinoModalPopup(
    context: context,
    builder: (ctx) {
      return SizedBox(
        height: 200,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.dateAndTime,
          minimumDate: date,
          maximumDate: date.add(
            Duration(days: 30),
          ),
          maximumYear: date.year + 1,
          onDateTimeChanged: (DateTime value) {
            print(value);
          },
        ),
      );
    },
  );
}
