import 'package:chat/app/modules/models/user.dart';
import 'package:flutter/material.dart';

typedef OnItemUserChatClick = Function(ItemUserChat);

abstract class ItemUserChat extends StatelessWidget {
  const ItemUserChat({Key key}) : super(key: key);

  Widget get childForCenter;

  void onTap();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      child: Material(
        color: Colors.transparent,
        child: Container(
          height: 50,
          width: 50,
          color: Colors.white.withAlpha(120),
          child: InkWell(
            onTap: onTap,
            child: childForCenter,
          ),
        ),
      ),
    );
  }
}

class ItemSearchChat extends ItemUserChat {
  final OnItemUserChatClick listener;

  ItemSearchChat({this.listener});

  @override
  Widget get childForCenter => Icon(
        Icons.search,
        color: Colors.white,
      );

  @override
  void onTap() {
    listener != null ? listener(this) : null;
  }
}

class ItemUserIconChat extends ItemUserChat {
  final User user;
  final OnItemUserChatClick listener;

  ItemUserIconChat(this.user, {this.listener});

  @override
  // TODO colocar a imagem do usuario aqui
  Widget get childForCenter => Container();

  @override
  void onTap() {
    if (listener != null) {
      listener(this);
    }
  }
}
