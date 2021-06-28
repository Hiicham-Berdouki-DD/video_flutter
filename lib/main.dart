import './views/stream_Custom_Subtitles_View.dart';
import './views/stream_Simple_View.dart';
import './views/video_ByLink_View.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Home()));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  var indexActive = 0;
  var indexPrev = 0;
  var currentWidget;
  var contextApp;

  renderCurrentPage(int index) {
    Widget result = Center();
    if (index == 0) {
      result = StreamSimpleView().renderPage(contextApp);
    }
    if (index == 1) {
      result = VideoByLinkVideoView().renderPage(contextApp);
    }
    if (index == 2) {
      result = StreamCustomSubtitlesView().renderPage(contextApp);
    }

    return result;
  }

  tapNavBottom(int index) {
    setState(() {
      indexPrev = indexActive;
      indexActive = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    contextApp = context;
    return Scaffold(
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(child: Container(child: renderCurrentPage(indexActive))),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black.withOpacity(.3),
        selectedItemColor: Colors.white,
        currentIndex: indexActive,
        onTap: tapNavBottom,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'StreamSimple',
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.mail),
            label: 'VideoByLinkVideo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'StreamCustomSubtitles',
          ),
        ],
      ),
    );
  }
}
