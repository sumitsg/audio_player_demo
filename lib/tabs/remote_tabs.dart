import 'package:audio_player_demo/widgets/audio_player_widget.dart';
import 'package:flutter/material.dart';

class RemoteTabs extends StatelessWidget {
  const RemoteTabs({Key? key}) : super(key: key);

  static const String _remoteUrl =
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: const [
          Text('Remote Audio'),
          AudioPlayerWidget(
            url: _remoteUrl,
            isAsset: false,
          )
        ],
      ),
    );
  }
}
