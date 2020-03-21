import 'package:chat/app/modules/base/components/base_sliver_for_percent.dart';
import 'package:chat/app/modules/resources/chat_colors.dart';
import 'package:flutter/material.dart';

import 'components/chat_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: BaseSliverForPercent(
                expandedHeight: 260,
                minHeight: 100,
                update: (double percent, double maxHeight) => ChatHeader(
                  percentage: percent,
                  height: maxHeight,
                ),
              ),
            ),
            SliverFillRemaining(
              child: Center(
                child: Text("data"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
