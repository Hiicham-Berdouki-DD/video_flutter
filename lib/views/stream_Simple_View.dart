import '../utils/grid_layout.dart';
import 'package:flutter/material.dart';

class StreamSimpleView {
  var grid = new GridLayout();

  createGrid(context) {
    grid.addLayout([
      {"width": 10, "height": 600, "widget": "StreamArriyadia", "params": {}}
    ]);

    return grid;
  }

  renderPage(context) {
    return Column(children: createGrid(context).mergeGrid(20));
  }
}
