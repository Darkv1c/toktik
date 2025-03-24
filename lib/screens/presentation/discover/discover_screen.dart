import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:toktik/screens/presentation/providers/discover_provider.dart';

class DiscoverScreen extends StatelessWidget {
  const DiscoverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => DiscoverProvider())],
      child: Scaffold(body: Center(child: Text('Discover Screen'))),
    );
  }
}
