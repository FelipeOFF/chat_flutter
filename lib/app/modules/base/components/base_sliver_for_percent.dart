import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class BaseSliverForPercent extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double minHeight;
  final Widget Function(double, double) update;

  BaseSliverForPercent({
    @required this.expandedHeight,
    this.minHeight = kToolbarHeight,
    @required this.update,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return LayoutBuilder(
      builder: (count, constraints) {
        final double percentage =
            (constraints.maxHeight - minExtent) / (maxExtent - minExtent);
        return update(percentage, maxExtent);
      },
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
