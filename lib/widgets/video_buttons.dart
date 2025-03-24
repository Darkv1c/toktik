import 'package:flutter/material.dart';
import 'package:toktik/config/helpers/human_formats.dart';
import 'package:toktik/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  final VideoPost video;

  const VideoButtons({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _CustomButton(
            value: video.likes,
            icon: Icons.favorite,
            iconColor: Colors.red,
          ),
          _CustomButton(value: video.views, icon: Icons.remove_red_eye),
          _CustomButton(stringValue: 'Share', icon: Icons.share),
        ],
      ),
    );
  }
}

class _CustomButton extends StatelessWidget {
  final int? value;
  final String _stringValue;
  final IconData icon;
  final Color _iconColor;

  const _CustomButton({
    this.value,
    stringValue = '',
    required this.icon,
    iconColor = Colors.white,
  }) : _iconColor = iconColor,
       _stringValue = stringValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, icon: Icon(icon, color: _iconColor)),
        Text(
          value != null ? HumanFormats.readableNumber(value!) : _stringValue,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
