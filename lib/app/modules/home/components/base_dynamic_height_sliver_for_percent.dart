import 'package:chat/app/modules/base/components/base_sliver_for_percent.dart';
import 'package:flutter/material.dart';

class BaseDynamicHeightSliverForPercent extends BaseSliverForPercent {
  final double animationExpandedHeight;
  final double minAnimation;
  final double maxAnimation;
  final double minHeight;
  final Widget Function(double, double) update;

  BaseDynamicHeightSliverForPercent(
      {@required this.minAnimation,
      @required this.animationExpandedHeight,
      @required this.maxAnimation,
      this.minHeight = kToolbarHeight,
      @required this.update})
      : super(
            expandedHeight: (maxAnimation * animationExpandedHeight) +
                (minAnimation - (minAnimation * animationExpandedHeight)),
            minHeight: minHeight,
            update: update);

  @override
  double get maxExtent =>
      (maxAnimation * animationExpandedHeight) +
      (minAnimation - (minAnimation * animationExpandedHeight));

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
