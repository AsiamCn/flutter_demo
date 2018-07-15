import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';




class FavoriteWidget extends StatefulWidget {

  FavoriteWidget({Key key}):super(key:key);

  @override
  State<StatefulWidget> createState() {
    return FavoriteState();
  }

}

class FavoriteState extends State<FavoriteWidget> {

  bool _isFavorited = true;
  int _favoriteCount = 41;

  void _toggleFavorite() {

       setState(() {
         print("setState");
         if (_isFavorited) {
           _favoriteCount -= 1;
           _isFavorited = false;
         } else {
           _favoriteCount+=1;
           _isFavorited = true;
         }
       });
       print("setState2");
  }


  @override
  Widget build(BuildContext context) {
    print("flutter build");
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(0.0),
          child: new IconButton(
            icon: (_isFavorited
            ? Icon(Icons.star) : Icon(Icons.star_border)),
            color: Colors.red[900],
            onPressed: _toggleFavorite,
          ),
        ),
        new SizedBox(
          width: 18.0,
          child: Text('$_favoriteCount'),
        )
      ],
    );
  }
}