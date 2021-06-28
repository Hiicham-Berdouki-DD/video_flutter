import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class StreamCustomSubtitles extends StatefulWidget {
  const StreamCustomSubtitles({Key? key}) : super(key: key);

  @override
  _StreamCustomSubtitlesState createState() => _StreamCustomSubtitlesState();
}

class _StreamCustomSubtitlesState extends State<StreamCustomSubtitles> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Text('Stream Normal and theme material '),
      SizedBox(
        height: 20,
      ),
      BetterPlayerPlaylist(
        betterPlayerConfiguration: BetterPlayerConfiguration(
          aspectRatio: 16 / 9,
          controlsConfiguration: BetterPlayerControlsConfiguration(
            playerTheme: BetterPlayerTheme.material,
          ),
        ),
        betterPlayerPlaylistConfiguration: BetterPlayerPlaylistConfiguration(),
        betterPlayerDataSourceList: StreamNormal(),
      ),
      SizedBox(
        height: 20,
      ),
      Text('Stream with custom language(typo) and theme cupertino + cache '),
      SizedBox(
        height: 20,
      ),
      BetterPlayerPlaylist(
          betterPlayerConfiguration: BetterPlayerConfiguration(
            subtitlesConfiguration: BetterPlayerSubtitlesConfiguration(
              fontSize: 30,
              fontColor: Colors.green,
            ),
            aspectRatio: 16 / 9,
            controlsConfiguration: BetterPlayerControlsConfiguration(
              pauseIcon: Icons.pause_circle_outlined,
              playIcon: Icons.play_arrow_outlined,
              playerTheme: BetterPlayerTheme.cupertino,
            ),
          ),
          betterPlayerPlaylistConfiguration:
              BetterPlayerPlaylistConfiguration(),
          betterPlayerDataSourceList: Streamwithcustomlanguage()),
      SizedBox(
        height: 20,
      ),
    ]);
  }

//StreamNormal
  List<BetterPlayerDataSource> StreamNormal() {
    List<BetterPlayerDataSource> dataSourceList = [];

    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
        liveStream: false,
        useAsmsSubtitles: true,
      ),
    );

    return dataSourceList;
  }

//Stream with custom language

  List<BetterPlayerDataSource> Streamwithcustomlanguage() {
    List<BetterPlayerDataSource> dataSourceList = [];

    dataSourceList.add(
      BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://bitdash-a.akamaihd.net/content/sintel/hls/playlist.m3u8",
        liveStream: false,
        useAsmsSubtitles: true,
        cacheConfiguration: BetterPlayerCacheConfiguration(
          useCache: true,
          maxCacheFileSize: 5,
          maxCacheSize: 4,
          preCacheSize: 5,
        ),
        subtitles: [
          BetterPlayerSubtitlesSource(
            type: BetterPlayerSubtitlesSourceType.network,
            name: "Langue 1",
            urls: [
              "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
            ],
          ),
          BetterPlayerSubtitlesSource(
            type: BetterPlayerSubtitlesSourceType.network,
            name: "Langue 2",
            urls: [
              "https://dl.dropboxusercontent.com/s/71nzjo2ux3evxqk/example_subtitles.srt"
            ],
          ),
        ],
      ),
    );
    return dataSourceList;
  }
}
