import 'package:flutter/material.dart';

// GridView滚动：简单显示电影海报

void main() {
  runApp(new MaterialApp(title: '简单电影海报', home: new MinePage()));
}

class MinePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('我的电影海报')),
        body: GridView(
          padding: const EdgeInsets.all(5.0),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, //每行个数
              mainAxisSpacing: 2.0, //每行间距
              crossAxisSpacing: 2.0, //每列间距
              childAspectRatio: 0.75 //长宽比
              ),
          children: <Widget>[
            new Image.network(
                'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2557573348.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1446261379.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1613191025.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2540924496.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2174346180.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p454118602.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1998028598.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p456676352.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1917567652.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2398213627.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1637195728.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1335271624.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2557573348.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1446261379.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1613191025.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2540924496.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p2174346180.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p454118602.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1998028598.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p456676352.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img3.doubanio.com/view/photo/s_ratio_poster/public/p1917567652.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2398213627.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p1637195728.webp',
                fit: BoxFit.cover),
            new Image.network(
                'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p1335271624.webp',
                fit: BoxFit.cover),
          ],
        ));
  }
}
