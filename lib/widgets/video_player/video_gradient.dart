import 'package:flutter/material.dart';

class VideoGradient extends StatelessWidget {
  final Color endColor;
  final List<double> stops;

  const VideoGradient({
    super.key,
    this.endColor = Colors.black,
    this.stops = const [0.5, 1.0],
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: stops,
            colors: [Colors.transparent, endColor],
          ),
        ),
      ),
    );
  }
}
