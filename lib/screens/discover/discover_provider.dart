import 'package:flutter/material.dart';
import 'package:toktik/domain/entities/video_post.dart';
import 'package:toktik/domain/repositories/video_posts_repository.dart';
import 'package:toktik/infrastructure/models/local_video_model.dart';
import 'package:toktik/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  final VideoPostsRepository videoPostsRepository;
  bool _initialLoading = true;
  final List<VideoPost> videos = [];
  bool get initialLoading => _initialLoading;

  DiscoverProvider({required this.videoPostsRepository});

  Future<void> loadNextPage() async {
    await Future.delayed(Duration(seconds: 2));

    final List<VideoPost> newVideos = await videoPostsRepository
        .getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    _initialLoading = false;

    notifyListeners();
  }
}
