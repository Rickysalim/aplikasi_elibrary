import 'package:e_library_nama_elib_mobile/view/widgets/skeleton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class ListVertical extends StatelessWidget {
  ListVertical({required this.data, required this.itemExtent,required this.scrollController});
  List data;
  ScrollController scrollController;
  double itemExtent;
  

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
      controller: scrollController,
      scrollDirection: Axis.horizontal,
      itemExtent: itemExtent,
      itemBuilder: (BuildContext context, int index) {
        if (index == data.length) {
          return Skeleton(width: 120, height: 120);
        }
        return ListTile(title: Text(data[index]));
      },
      itemCount: data.length + 1,
    ));
  }
}
