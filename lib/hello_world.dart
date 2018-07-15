import 'package:flutter/material.dart';

//class HelloWorldScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("HelloWorld"),
//      ),
//      body: new Center(
//        child: new Text(
//          "Hello World!",
//          style: new TextStyle(fontSize: 20.0),
//        ),
//      )
//    );
//  }
//}

//class HelloWorldScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//      appBar: new AppBar(
//        title: new Text("HelloWorld"),
//      ),
//      body: new Center(
//        child: new CloseButton()
//      )
//    );
//  }
//}

//class HelloWorldScreen extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    return new HelloWordState();
//  }
//}
//
//class HelloWordState extends State<HelloWorldScreen> {
//  bool _color = true;
//
//  void _changeColor() {
//    setState(() {
//      _color = !_color;
//    });
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    print("start build");
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text(
//            "HelloWorld",
//            style: new TextStyle(color: _color ? Colors.red : Colors.black),
//          ),
//        ),
//        body: new Center(
//            child: new IconButton(
//                icon: new Icon(Icons.android), onPressed: _changeColor)));
//  }
//}

//打印约束
//class HelloWorldScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("HelloWorld"),
//        ),
//        body: new SizedBox(
//          width: 50.0,
//          child: new LayoutBuilder(builder: (context, constraints) {
//            print(constraints);
//            return new SizedBox.expand(
//              child: new Container(
//                width: 10.0,
//                height: 50.0,
//                color: Colors.blue,
//              ),
//            );
//          }),
////          child: new SizedBox.expand(
////            child: new Container(
////              width: 10.0,
////              height: 50.0,
////              color: Colors.blue,
////            ),
////          ),
////
//        ));
//  }

//外部约束导致内部大小设置无效的例子
// class HelloWorldScreen extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return new Scaffold(
//        appBar: new AppBar(
//          title: new Text("HelloWorld"),
//        ),
//        body: new SizedBox(
//          width: 50.0,
//          height: 50.0,
//          child: new SizedBox.expand(
//            child: new Container(
//              width: 10.0,
//              height: 50.0,
//              color: Colors.blue,
//            ),
//          ),
//        ));
//  }
//}

//layer 4 test
class HelloWorldScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("HelloWorld"),
      ),
      body: new CustomPaint(
        painter: new BackPaint(),
        foregroundPainter: ForwdPaint(),
        child: new RepaintBoundary(
        child: new Container(
              width: 10.0,
              height: 500.0,
              color: Colors.blue,
            ),
        ),
      ),
    );
  }
}

class BackPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print("back:"+canvas.hashCode.toString());
    canvas.drawLine(new Offset(100.0, -50.0).translate(0.0, 100.0),
        new Offset(0.0, 100.0).translate(0.0, 100.0), new Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class ForwdPaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    print("bforw:"+canvas.hashCode.toString());
    canvas.translate(0.0, 50.0);
    canvas.drawLine(new Offset(100.0, -50.0).translate(0.0, 100.0),
        new Offset(0.0, 100.0).translate(0.0, 100.0), new Paint());
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
