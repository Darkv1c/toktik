import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  // TODO: Repository, Data Source

  bool _initialLoading = true;
  final List<VideoPost> videos = [];

  bool get initialLoading => _initialLoading;

  Future<void> loadNextPage() async {
    await Future.delayed(Duration(seconds: 2));

    final List<VideoPost> newVideos =
        videoPosts
            .map((video) => LocalVideoModel.fromJson(video).toVideoPost())
            .toList();

    videos.addAll(newVideos);
    _initialLoading = false;

    notifyListeners();
  }
}
