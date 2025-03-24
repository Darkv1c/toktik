import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/config/theme/app_theme.dart';
import 'package:toktik/screens/discover/discover_provider.dart';
import 'package:toktik/screens/discover/discover_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        title: 'TokTik',
        debugShowCheckedModeBanner: false,
        theme: AppTheme().getTheme(),
        home: ChangeNotifierProvider(
          create: (_) => DiscoverProvider()..loadNextPage(),
          child: const DiscoverScreen(),
        ),
      ),
    );
  }
}
