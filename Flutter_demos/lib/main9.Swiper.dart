import 'package:flutter/material.dart';

import 'package:flutter_swiper/flutter_swiper.dart';
// 轮播图

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List _imageUrls = [
         "https://dimg04.c-ctrip.com/images/0zg2o1200086hnkqm55C9.jpg",
         "https://youimg1.c-ctrip.com/target/100e0h0000008rp39A12F_D_960_10000.jpg",
         "https://youimg1.c-ctrip.com/target/100j0y000000ls35h5147_D_960_10000.jpg",
         "https://youimg1.c-ctrip.com/target/100h0z000000mkjxn58E1_D_960_10000.jpg"
       ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text(widget.title),
        ),
        body: Container(
          height: 200,
          child: new Swiper(
            itemBuilder: (BuildContext context, int index) {
              return new Image.network(
                _imageUrls[index],
                fit: BoxFit.fill,
              );
            },
            itemCount: _imageUrls.length,
            pagination: new SwiperPagination(),
            autoplay: true,
            control: new SwiperControl(),
          ),
        ));
  }
}
