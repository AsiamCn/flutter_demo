import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SecondScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _FullStateWidaget();
  }
}

class _FullStateWidaget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _FullState();
  }
}

class _FullState extends State<_FullStateWidaget> {
  bool _colorFlag = true;
  bool _positionFlag = true;

  GlobalKey<_MyState> globalKey = new GlobalKey<_MyState>();

  @override
  Widget build(BuildContext context) {
    print("build full state");

    void _invertColorFlag() {
      setState(() {
        _colorFlag = !_colorFlag;
      });
    }

    void _invertPositionFlag() {
      setState(() {
        _positionFlag = !_positionFlag;
      });
    }

    var contents = <Widget>[
      new RaisedButton(
        child: const Text('Change Color'),
        onPressed: () {
          _invertColorFlag();
        },
      ),
      const SizedBox(height: 10.0),
      new RaisedButton(
        child: const Text('Change Position'),
        onPressed: () {
          _invertPositionFlag();
        },
      ),
    ];

    final statefulWidget = new _MyStatefulWidget(
      key: globalKey,
      value: 10,
      textColor: _colorFlag ? const Color(0xffff0000) : null,
    );

    if (_positionFlag) {
      contents.add(statefulWidget);
    } else {
      contents.insert(0, statefulWidget);
    }

    Widget colW = new Column(
      mainAxisSize: MainAxisSize.min,
      children: contents,
    );

    Widget rowW = new Row(
      mainAxisSize: MainAxisSize.min,
      children: contents,
    );


    return new Scaffold(
      appBar: new AppBar(
        title: const Text('Stateful Demo'),
      ),
      body: new Center(
        child: colW,
      )
    );
  }
}

class _MyStatefulWidget extends StatefulWidget {
  int value;
  Color textColor;

  _MyStatefulWidget({Key key, this.value, this.textColor}) : super(key : key);

  @override
  State<StatefulWidget> createState() {
    print("my state create la");
    return _MyState(num: value, color: textColor);
  }


  @override
  StatefulElement createElement() {
    print("my state create element again");
    return super.createElement();
  }
}

class _MyState extends State<_MyStatefulWidget> {
  int num;
  Color color;

  _MyState({this.num, this.color});

  void _increace() {
    setState(() {
      num++;
    });
  }

  void _decreace() {
    setState(() {
      num--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        IconButton(icon: Icon(Icons.thumb_up), onPressed: _increace),
        new Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            '$num',
            style: TextStyle(color: widget.textColor),
          ),
        ),
        IconButton(icon: Icon(Icons.thumb_down), onPressed: _decreace),
      ],
    );
  }
}
