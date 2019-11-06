// This class will provide the access of bloc tothe particular class
//#SCOPED INSTANCE BLOC Pattern

import 'package:flutter/material.dart';
import 'bloc.dart';

class Provider extends InheritedWidget {
  final bloc = BLOC();

  Provider({Key key, Widget child}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_) {
    // TODO: implement updateShouldNotify
    return true;
  }

  static BLOC of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(Provider) as Provider).bloc;
    //The above statement shall tell the widget to know about the context of its parent widget, as well the context of al of its parent widget untill it finds the widget of type "Provider"
    //The function will return the Widget of type Provider(which is references like: "as Provider")
    //After we get the Widget, we get the BLoc Property
  }
}
