import 'package:better_player/better_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoExterne extends StatefulWidget {
  const VideoExterne({Key? key}) : super(key: key);

  @override
  _VideoExterneState createState() => _VideoExterneState();
}

class _VideoExterneState extends State<VideoExterne> {
  BetterPlayerController _betterPlayerController = BetterPlayerController(
    BetterPlayerConfiguration(),
  );

  @override
  void initState() {
    super.initState();
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");

    setState(() {
      print(BetterPlayerEventType.values);
    });
    print(BetterPlayerEventType.controlsHidden);
    _betterPlayerController.addEventsListener((pause) {
      print("Better player event: ${pause.betterPlayerEventType}");
    });
    // _betterPlayerController.betterPlayerConfiguration(
    //   BetterPlayerConfiguration(
    //     subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
    //       fontSize: 20,
    //       fontColor: Colors.green,
    //     ),
    //   ),
    // );

    _betterPlayerController = BetterPlayerController(
        BetterPlayerConfiguration(),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20,
      ),
      Text('Video With events'),
      BetterPlayer(controller: _betterPlayerController),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 20,
      ),
      // Text('Video Externe'),
      // SizedBox(
      //   height: 20,
      // ),
      // BetterPlayer.network(
      //   "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
      //   betterPlayerConfiguration: BetterPlayerConfiguration(
      //     autoPlay: false,
      //   ),
      // ),
      Text('Video different Quality'),
      SizedBox(
        height: 20,
      ),
      BetterPlayerPlaylist(
        betterPlayerConfiguration: BetterPlayerConfiguration(

          aspectRatio: 16 / 9,
          subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
            fontSize: 20,
            fontColor: Colors.green,
          ),
          controlsConfiguration: BetterPlayerControlsConfiguration(
              playerTheme: BetterPlayerTheme.material,
              // all icons color
              iconsColor: Colors.red,
              controlBarColor: Colors.amberAccent,
              textColor: Colors.indigo,
              qualitiesIcon: Icons.high_quality_outlined,
              progressBarPlayedColor: Colors.green,
              pipMenuIcon: Icons.ac_unit_outlined,
              overflowMenuIcon: Icons.ac_unit),
        ),

        betterPlayerPlaylistConfiguration: BetterPlayerPlaylistConfiguration(),
        betterPlayerDataSourceList: StreamNormal(),
      ),
    ]);
  }

  List<BetterPlayerDataSource> StreamNormal() {
    List<BetterPlayerDataSource> dataSourceList = [];

    dataSourceList.add(
      BetterPlayerDataSource(

        BetterPlayerDataSourceType.network,
        "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4",
        resolutions: {
          "Low":
              "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_480_1_5MG.mp4",
          "Medium":
              "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_640_3MG.mp4",
          "High":
              "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1280_10MG.mp4",
          "extra high":
              "https://file-examples-com.github.io/uploads/2017/04/file_example_MP4_1920_18MG.mp4"
        },
      ),

    );

    return dataSourceList;
  }
}
