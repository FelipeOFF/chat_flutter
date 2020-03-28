import 'package:chat/app/modules/home/components/list/item_user_chat.dart';
import 'package:chat/app/modules/models/user.dart';
import 'package:flutter/material.dart';

class ListHeaderChat extends StatelessWidget {
  const ListHeaderChat({
    Key key,
    @required this.percentage,
    @required this.startAnimation,
  }) : super(key: key);

  final double startAnimation;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _getPercentForOpacity(),
      child: Container(
        height: 50,
        child: ListView.separated(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: 20,
          padding: EdgeInsets.only(
            left: (160 - (160.0 * percentage)) + 40.0,
            right: 40.0,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return index == 0
                ? ItemSearchChat(
                    listener: (value) {},
                  )
                : ItemUserIconChat(
                    User(name: "Felipe"),
                    listener: (value) {},
                  );
          },
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(
              width: 12.0,
            );
          },
        ),
      ),
    );
  }

  double _getPercentForOpacity() =>
      1.0 -
      ((1.0 - startAnimation) <= 0.5 ? (1.0 - startAnimation) / 0.5 : 1.0);
}
