import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    Key ? key,
    this.height,
    this.width,
  }) : super(key: key);

  final double? height, width;
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: height,
      height: width,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.04),
      ),
    );
  }

}