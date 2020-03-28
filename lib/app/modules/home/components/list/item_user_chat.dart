import 'dart:math';

import 'package:chat/app/modules/models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

typedef OnItemUserChatClick = Function(ItemUserChat);

abstract class ItemUserChat extends StatelessWidget {
  const ItemUserChat({Key key}) : super(key: key);

  Widget get childForCenter;

  void onTap();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50.0)),
      child: Container(
        height: 50,
        width: 50,
        color: Colors.white.withAlpha(100),
        child: Stack(
          children: <Widget>[
            childForCenter,
            Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onTap,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ItemSearchChat extends ItemUserChat {
  final OnItemUserChatClick listener;

  ItemSearchChat({this.listener});

  @override
  Widget get childForCenter => Center(
        child: Icon(
          Icons.search,
          color: Colors.white,
        ),
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
  Widget get childForCenter {
    return Center(
      child: user.photo != null
          ? Image.network(user.photo)
          : Container(
              color: user.color,
              child: Center(
                  child: Text(
                user.name[0].toUpperCase(),
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w500,
                ),
              )),
            ),
    );
  }

  @override
  void onTap() {
    if (listener != null) {
      listener(this);
    }
  }
}
