import 'package:chat/app/modules/home/components/list/item_chat_list_tile.dart';
import 'package:flutter/material.dart';

import '../../models/user.dart';

class ListClient extends StatelessWidget {
  const ListClient({
    Key key,
    @required this.data,
  }) : super(key: key);

  final List<User> data;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        List<Widget>.generate(
          data.length,
          (index) {
            var user = data[index];
            return ItemChatListTile(user: user);
          },
        ),
      ),
    );
  }
}
