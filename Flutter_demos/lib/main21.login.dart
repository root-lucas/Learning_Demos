import 'package:flutter/material.dart';

// 表单登录页
void main() => runApp(new HomePage());

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  String _name;
  String _password;

  void _forSubmitted() {
    // 获取 FormState 并调用相关方法
    var _form = _formKey.currentState;

    // 此方法会调用每一个FormField的validator回调进行数据验证
    if (_form.validate()) {
      _form.save(); // 保存表单数据

      // _form.reset(); // 清除表单数据
      print(_name);
      print(_password);
      // loginRequest(_name,_password);
    }
  }

  void _reset() {
    var _form = _formKey.currentState;
    if (_form.validate()) {
      _form.reset(); // 清除表单数据
      print(_name);
      print(_password);
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      title: 'Flutter data',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter Form'),
        ),
        floatingActionButton: new FloatingActionButton(
          onPressed: _forSubmitted,
          child: new Text('提交'),
        ),
        body: new Container(
          padding: const EdgeInsets.all(16.0),
          child: new Form(
            key: _formKey,
            child: new Column(
              children: <Widget>[
                new TextFormField(
                  decoration: new InputDecoration(
                      labelText: 'Your Name', hintText: '输入账号', prefixIcon: Icon(Icons.person)),
                  onSaved: (val) {
                    _name = val; // 保存用户输入的表单数据
                  },
                  validator: (String value) {
                    return value.length < 6 ? '账号最少6个字符' : null;
                  },
                ),
                new TextFormField(
                  decoration: new InputDecoration(
                      labelText: 'Password', hintText: '输入密码', prefixIcon: Icon(Icons.lock)),
                  obscureText: true, // 输入不可见
                  onSaved: (val) {
                    _password = val;
                  },
                  validator: (String value) {
                    return value.length < 6 ? '密码最少6个字符' : null;
                  },
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      child: Text('登录'),
                      onPressed: _forSubmitted,
                    ),
                    SizedBox(width: 40),
                    RaisedButton(
                      child: Text('Reset'),
                      onPressed: _reset,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
