import '../componenets/streamArriyadia.dart';
import '../componenets/streamCustomSubtitles.dart';
import '../componenets/videoExterne.dart';
import 'package:flutter/material.dart';

class GridLayout {
  var layoutGlobal = [];

  getWidget(name, params) {
    Widget widgetResult = Center();

    if (name == "StreamArriyadia") {
      widgetResult = StreamArriyadia();
    }

    if (name == "VideoExterne") {
      widgetResult = VideoExterne();
    }

    if (name == "StreamCustomSubtitles") {
      widgetResult = StreamCustomSubtitles();
    }

    return widgetResult;
  }

  addLayout(widget) {
    layoutGlobal.add(widget);
  }

  mergeGrid(padding) {
    return createGrid(layoutGlobal, padding);
  }

  createGrid(layout, padding) {
    final children = <Widget>[];
    double padding = 10;
    for (var i = 0; i < layout.length; i++) {
      var item = layout[i];
      var childrenItem = item;
      var childrenCount = childrenItem.length;
      if (childrenCount == 1) {
        var firstItem = item[0];
        var widgetComponent =
            getWidget(firstItem["widget"], firstItem["params"]);
        children.add(Padding(
          padding: EdgeInsets.all(padding),
          child: Container(
              height: firstItem["height"].toDouble(),
              //width: firstItem["width"].toDouble(),
              child: widgetComponent),
        ));
      } else {
        final childrenColumns = <Widget>[];
        for (var j = 0; j < childrenCount; j++) {
          var widgetComponent = getWidget(item[j]["widget"], item[j]["params"]);
          childrenColumns.add(Expanded(
              flex: item[j]["width"],
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Container(child: widgetComponent),
              )));
        } // for j

        children.add(Container(child: Row(children: childrenColumns)));
      } // else

    } // for i
    return children;
  } // function createGrid
}

/*
Animator<double>(
              resetAnimationOnRebuild: true,
              duration: Duration(seconds: 2),
              cycles: 1,
              builder: (_, anim, __) => Container(
                child: Transform.scale(
                  scale: anim.value,
                  child :

                ),
              ),
            ),
 */
