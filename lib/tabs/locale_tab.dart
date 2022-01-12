import 'dart:io';

import 'package:audio_player_demo/widgets/audio_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';

class LocaleTabs extends StatefulWidget {
  const LocaleTabs({Key? key}) : super(key: key);

  @override
  _LocaleTabsState createState() => _LocaleTabsState();
}

class _LocaleTabsState extends State<LocaleTabs> {
  static const String _remoteUrl =
      'https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadFilePath(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              const Text('Local Audio'),
              AudioPlayerWidget(
                url: snapshot.data ?? '',
                isAsset: false,
              )
            ],
          ),
        );
      },
    );
  }

  Future<String> _loadFilePath() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/downloaded_audio.mp3');

    if (await _assetAlreadyPresent(file.path)) {
      return file.path;
    }
    final bytes = await readBytes(Uri.parse(_remoteUrl));
    await file.writeAsBytes(bytes);
    return file.path;
  }

  Future<bool> _assetAlreadyPresent(String filepath) async {
    final File file = File(filepath);
    return file.exists();
  }
}
