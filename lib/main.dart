import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/infrastructure/data_sources/local_video_posts_data_source_impl.dart';
import 'package:toktik/infrastructure/repositories/video_posts_repository_impl.dart';
import 'package:toktik/screens/discover/discover_provider.dart';
import 'package:toktik/screens/discover/discover_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPosts = VideoPostsRepositoryImpl(
      dataSource: LocalVideoPostsDataSourceImpl(),
    );

    return MaterialApp(
      title: 'TokTik',
      debugShowCheckedModeBanner: false,
      theme: AppTheme().getTheme(),
      home: ChangeNotifierProvider(
        create:
            (_) =>
                DiscoverProvider(videoPostsRepository: videoPosts)
                  ..loadNextPage(),
        child: const DiscoverScreen(),
      ),
    );
  }
}
