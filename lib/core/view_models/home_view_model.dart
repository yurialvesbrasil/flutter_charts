import 'package:flutter/material.dart';

import 'base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  Color _cor = Colors.transparent;
  Color get cor => _cor;

  ScrollController _controller;
  ScrollController get controller => _controller;

  HomeViewModel() {
    _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.offset <= _controller.position.minScrollExtent &&
          !_controller.position.outOfRange) {
        _cor = Colors.transparent;
        notifyListeners();
      } else {
        _cor = Colors.red[500];
        notifyListeners();
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void setCor(Color cor) {
    _cor = cor;
    notifyListeners();
  }
}
