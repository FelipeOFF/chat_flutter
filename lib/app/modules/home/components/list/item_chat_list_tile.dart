import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../models/user.dart';
import '../../../resources/chat_colors.dart';
import 'item_user_chat.dart';

class ItemChatListTile extends StatelessWidget {
  const ItemChatListTile({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 40),
        leading: ItemUserIconChat(
          user,
          listener: null,
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              user.name,
              style: TextStyle(
                color: ChatColors.blue_343264,
              ),
            ),
            Text(
              "12:00",
              style: TextStyle(
                color: ChatColors.grey_8E8D9D,
              ),
            ),
          ],
        ),
        subtitle: Text(
          'Hello',
          style: TextStyle(
            color: ChatColors.grey_8E8D9D,
          ),
        ),
      ),
      actionExtentRatio: 0.2,
      secondaryActions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(20),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(const Radius.circular(50.0)),
            child: Container(
              color: ChatColors.yellow_FD871D,
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
