import 'package:flutter/material.dart';

class PlayPauseButton extends StatelessWidget {
  final bool isPlaying;
  final VoidCallback onPlay;
  const PlayPauseButton({
    Key? key,
    required this.isPlaying,
    required this.onPlay,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isPlaying ? Icons.pause_circle : Icons.play_circle_fill,
        color: Colors.deepPurple,
        size: 52,
      ),
      onPressed: onPlay,
    );
  }
}
