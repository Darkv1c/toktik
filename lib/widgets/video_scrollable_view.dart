import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoScrollableView extends StatelessWidget {
  List<VideoPost> videos;

  VideoScrollableView({super.key, this.videos = const []});

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      physics: const BouncingScrollPhysics(),
      children: [Container(color: Colors.red), Container(color: Colors.blue)],
    );
  }
}
