import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return LoadingAnimationWidget.staggeredDotsWave(
      color: Colors.white,
      size: 100,
    );
  }
}