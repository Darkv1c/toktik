import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel({
    required this.name,
    required this.videoUrl,
    this.likes = 0,
    this.views = 0,
  });

  factory LocalVideoModel.fromJson(Map<String, dynamic> map) => LocalVideoModel(
    name: map['name'] ?? '-',
    videoUrl: map['videoUrl'] ?? '-',
    likes: map['likes'],
    views: map['views'],
  );

  VideoPost toVideoPost() =>
      VideoPost(caption: name, videoUrl: videoUrl, likes: likes, views: views);
}
