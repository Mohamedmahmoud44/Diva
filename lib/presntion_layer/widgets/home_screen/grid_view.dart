import 'package:flutter/material.dart';

class ViewGrid extends StatelessWidget {
  final int crossAxisCount;
  final int itemCount;
  final Widget Function(BuildContext context, int index) itemBuilder;
  bool shrinkWrap;
  final double childAspectRatio;

  ScrollPhysics physics;

  ViewGrid(
      {Key? key,
      this.physics = const BouncingScrollPhysics(),
      this.shrinkWrap = true,
      required this.itemBuilder,
      required this.crossAxisCount,
      required this.itemCount,
      required this.childAspectRatio})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      physics: physics,
      shrinkWrap: shrinkWrap,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: 5,
          childAspectRatio: childAspectRatio,
          mainAxisSpacing: 5),
      itemBuilder: itemBuilder,
      itemCount: itemCount,
    );
  }
}
