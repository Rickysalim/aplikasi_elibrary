import 'package:e_library_nama_elib_mobile/view/widgets/skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ListVerticalSkeleton extends StatelessWidget {
  ListVerticalSkeleton({required this.data, required this.itemExtent});
  List data;
  double itemExtent;
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemExtent: itemExtent,
      itemBuilder: (BuildContext context, int index) {
        return Skeleton(width: 150, height: 120);
      },
      itemCount: data.length + 1,
    ));
  }
}