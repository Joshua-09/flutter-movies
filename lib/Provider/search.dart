import 'package:flutter/material.dart';

class WidgetProvider with ChangeNotifier {
  Map _search;

  Map get searchMovie {
    return _search;
  }

  setMovie(Map value) {
    _search = value;
    notifyListeners();
  }
  // Map<dynamic,dynamic> get inclusions {
  //   return _inclusions;
  // }

  // saddInclusions(Map item) {
  //   _inclusions.add("add":item);
  //   // This call tells the widgets that are listening to this model to rebuild.
  //   notifyListeners();
  // }

  // void rremoveInclusion(dynamic item) {
  //   _inclusions.remove(item);
  //   // This call tells the widgets that are listening to this model to rebuild.
  //   notifyListeners();
  // }
  // List<Like> get isLiked {
  //   return _isLiked;
  // }

  // setIsLiked(String value, bool checked) {
  //   _isLiked
  //       .firstWhere((element) => element.talentId == value)
  //       .setFavourite(checked);
  //   notifyListeners();
  // }
}
