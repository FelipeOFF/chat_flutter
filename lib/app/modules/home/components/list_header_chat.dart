import 'package:chat/app/modules/home/components/list/item_user_chat.dart';
import 'package:flutter/material.dart';

class ListHeaderChat extends StatelessWidget {
  const ListHeaderChat({
    Key key,
    @required this.percentage,
  }) : super(key: key);

  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      width: MediaQuery.of(context).size.width,
      top: (110.0 * percentage) + 35.0,
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
                : ItemSearchChat(
                    // trocar para ItemUserIconChat
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
}
