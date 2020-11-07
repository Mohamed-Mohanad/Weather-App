import 'package:flutter/cupertino.dart';

class ThemeProvider extends ChangeNotifier
{
  Color _color;

  set setColor(Color color)
  {
    print('color $color');
    this._color = color;
    notifyListeners();
  }
  Color get getColor => this._color;
}