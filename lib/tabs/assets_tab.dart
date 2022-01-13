import 'package:audio_player_demo/widgets/audio_player_widget.dart';
import 'package:flutter/material.dart';

class AssetsTab extends StatelessWidget {
  const AssetsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Column(
        children: const [
          Text('Asset Audio'),
          AudioPlayerWidget(
            url: 'audio2.mp3',
            isAsset: true,
          )
        ],
      ),
    );
  }
}
