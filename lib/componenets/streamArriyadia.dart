import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class StreamArriyadia extends StatefulWidget {
  const StreamArriyadia({Key? key}) : super(key: key);

  @override
  _StreamArriyadiaState createState() => _StreamArriyadiaState();
}

class _StreamArriyadiaState extends State<StreamArriyadia> {
  @override
  Widget build(BuildContext context) {
    print('Hello wolrd');
    return Column(
      children: [
        SizedBox(
          height: 20,
        ),
        Text('Stream Arriyadiya'),
        SizedBox(
          height: 20,
        ),
        BetterPlayer.network(
          "https://cdnamd-hls-globecast.akamaized.net/live/ramdisk/arriadia/hls_snrt/arriadia-avc1_400000=2-mp4a_130400_qad=1.m3u8",
          betterPlayerConfiguration: BetterPlayerConfiguration(
            autoPlay: false,
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Text('Stream Arriyadiya Datasource'),
        SizedBox(
          height: 20,
        ),
        BetterPlayerPlaylist(
            betterPlayerConfiguration:
                BetterPlayerConfiguration(aspectRatio: 16 / 9),
            betterPlayerPlaylistConfiguration:
                BetterPlayerPlaylistConfiguration(),
            betterPlayerDataSourceList: StreamArriyadiyaDatasource()),
      ],
    );
  }
}

List<BetterPlayerDataSource> dataSourceList = [];
//StreamArriyadiyaDatasource
List<BetterPlayerDataSource> StreamArriyadiyaDatasource() {
  dataSourceList.add(
    BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      "https://cdnamd-hls-globecast.akamaized.net/live/ramdisk/arriadia/hls_snrt/arriadia-avc1_400000=2-mp4a_130400_qad=1.m3u8",
      liveStream: true,
      useAsmsSubtitles: true,
    ),
  );

  return dataSourceList;
}
