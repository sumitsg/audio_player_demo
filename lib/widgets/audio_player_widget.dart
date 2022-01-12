import 'package:audio_player_demo/widgets/play_pause_button.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerWidget extends StatefulWidget {
  final String url;
  final bool isAsset;
  const AudioPlayerWidget({Key? key, required this.url, this.isAsset = false})
      : super(key: key);

  @override
  _AudioPlayerWidgetState createState() => _AudioPlayerWidgetState();
}

class _AudioPlayerWidgetState extends State<AudioPlayerWidget> {
  late AudioPlayer _audioPlayer;
  late AudioCache _audioCache;

  AudioPlayerState _playerState = AudioPlayerState.STOPPED;

  bool get _isPlaying => _playerState == AudioPlayerState.PLAYING;
  bool get _isLocal => !widget.url.contains('http');

  @override
  void initState() {
    _audioPlayer = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    _audioCache = AudioCache(fixedPlayer: _audioPlayer);
    AudioPlayer.logEnabled = true;

    _audioPlayer.onPlayerError.listen((msg) {
      print('audioPlayer error : $msg');
      setState(() {
        _playerState = AudioPlayerState.STOPPED;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PlayPauseButton(
          isPlaying: _isPlaying,
          onPlay: () => _playPause(),
        ),
        const SizedBox(
          width: 30,
        ),
        IconButton(
            onPressed: () => _stop(),
            icon: const Icon(
              Icons.stop,
              size: 58,
              color: Colors.red,
            ))
      ],
    );
  }

  _playPause() async {
    if (_playerState == AudioPlayerState.PLAYING) {
      final playerResult = await _audioPlayer.pause();
      if (playerResult == 1) {
        setState(() {
          _playerState = AudioPlayerState.PAUSED;
        });
      }
    } else if (_playerState == AudioPlayerState.PAUSED) {
      final playerResult = await _audioPlayer.resume();
      if (playerResult == 1) {
        setState(() {
          _playerState = AudioPlayerState.PLAYING;
        });
      }
    } else {
      if (widget.isAsset) {
        _audioPlayer = await _audioCache.play(widget.url);
        setState(() {
          _playerState = AudioPlayerState.PLAYING;
        });
      } else {
        final playerResult = await _audioPlayer.play(
          widget.url,
          isLocal: _isLocal,
        );
        if (playerResult == 1) {
          setState(() {
            _playerState = AudioPlayerState.PLAYING;
          });
        }
      }
    }
  }

  _stop() async {
    final playerResult = await _audioPlayer.stop();
    if (playerResult == 1) {
      setState(() {
        _playerState = AudioPlayerState.STOPPED;
      });
    }
  }
}
