import 'package:chat/app/modules/home/components/list/item_user_chat.dart';
import 'package:chat/app/modules/home/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ListHeaderChat extends StatefulWidget {
  const ListHeaderChat({
    Key key,
    @required this.percentage,
    @required this.startAnimation,
  }) : super(key: key);

  final double startAnimation;
  final double percentage;

  @override
  _ListHeaderChatState createState() => _ListHeaderChatState();
}

class _ListHeaderChatState
    extends ModularState<ListHeaderChat, HomeController> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _getPercentForOpacity(),
      child: Container(
        height: 50,
        child: Observer(builder: (_) {
          if (controller.users.hasError) {
            return Text("User list has error");
          } else if (controller.users.data == null) {
            return CircularProgressIndicator();
          }

          var data = controller.users.data;
          return ListView.separated(
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemCount: (data.length + 1),
            padding: const EdgeInsets.symmetric(
              horizontal: 40,
            ),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return index == 0
                  ? ItemSearchChat(
                      listener: (value) {},
                    )
                  : ItemUserIconChat(
                      data[index - 1],
                      listener: (value) {},
                    );
            },
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(
                width: 12.0,
              );
            },
          );
        }),
      ),
    );
  }

  double _getPercentForOpacity() =>
      1.0 -
      ((1.0 - widget.startAnimation) <= 0.5
          ? (1.0 - widget.startAnimation) / 0.5
          : 1.0);
}
