import 'package:flutter/material.dart';
import 'package:toktik/widgets/video_player/video_gradient.dart';
import 'package:video_player/video_player.dart';

class FullScreenPlayer extends StatefulWidget {
  final String videoUrl;
  final String? caption;

  const FullScreenPlayer({super.key, required this.videoUrl, this.caption});

  @override
  State<FullScreenPlayer> createState() => _FullScreenPlayerState();
}

class _FullScreenPlayerState extends State<FullScreenPlayer> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller =
        VideoPlayerController.asset(widget.videoUrl)
          ..initialize().then((_) {
            setState(() {});
          })
          ..setVolume(0)
          ..setLooping(true)
          ..play();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  void onTap() {
    if (controller.value.isPlaying) {
      controller.pause();
    } else {
      controller.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return controller.value.isInitialized
        ? GestureDetector(
          onTap: onTap,
          child: AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                VideoGradient(
                  endColor: Colors.black.withAlpha(230),
                  stops: [0.5, 1],
                ),
                Positioned(
                  bottom: 50,
                  left: 20,
                  child: _Caption(caption: widget.caption ?? ''),
                ),
              ],
            ),
          ),
        )
        : const Center(child: CircularProgressIndicator(strokeWidth: 2));
  }
}

class _Caption extends StatelessWidget {
  final String caption;

  const _Caption({required this.caption});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return SizedBox(
      width: size.width * 0.6,
      child: Text(caption, style: titleStyle?.copyWith(color: Colors.white)),
    );
  }
}
