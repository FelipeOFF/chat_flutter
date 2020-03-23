import 'package:chat/app/modules/base/components/base_sliver_for_percent.dart';
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
          physics: PageScrollPhysics(),
          slivers: <Widget>[
            SliverPersistentHeader(
              pinned: true,
              floating: true,
              delegate: BaseSliverForPercent(
                expandedHeight: 300,
                minHeight: 100,
                update: (double percent, double maxHeight) {
                  print(percent);
                  return ChatHeader(
                    percentage: percent,
                    height: maxHeight,
                  );
                },
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
