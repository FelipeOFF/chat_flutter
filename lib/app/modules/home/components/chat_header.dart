import 'dart:ui';

import 'package:chat/app/modules/home/components/list_header_chat.dart';
import 'package:chat/app/modules/resources/chat_colors.dart';
import 'package:chat/app/modules/resources/chat_fonts.dart';
import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  final double percentage;
  final double startAnimation;
  final double height;

  const ChatHeader({
    Key key,
    @required this.startAnimation,
    @required this.percentage,
    @required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/imgs/header_bkg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          _listNames(context),
          _titleHeader(),
          _buildOptions(),
          _buildHeaderBottomWhite(context)
        ],
      ),
    );
  }

  Positioned _buildHeaderBottomWhite(BuildContext context) => Positioned(
        bottom: -1,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 28.0 * percentage,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(28.0 * percentage),
              topRight: Radius.circular(28.0 * percentage),
            ),
            color: Colors.white,
          ),
        ),
      );

  Positioned _buildOptions() => Positioned(
        top: 216 * percentage,
        right: 250 - (250 * startAnimation),
        child: Opacity(
          opacity: _getPercentForRowOptions(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0),
            child: Row(
              children: <Widget>[
                _optionItem(true, "Messages"),
                _optionItem(false, "Calls"),
                _optionItem(false, "Groups"),
                _optionButton()
              ],
            ),
          ),
        ),
      );

  double _getPercentForOpacity() =>
      startAnimation == 0.0 || startAnimation == 1.0
          ? percentage
          : startAnimation;

  double _getPercentForRowOptions({double base = 0.14}) =>
      1.0 -
      ((1.0 - _getPercentForOpacity()) <= base
          ? (1.0 - _getPercentForOpacity()) / base
          : 1.0);

  Widget _optionButton() => Row(
        children: <Widget>[
          SizedBox(
            width: 15.0,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Material(
              color: Colors.white.withAlpha(120),
              child: InkWell(
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14.0,
                    vertical: 6.0,
                  ),
                  child: Text(
                    "CREATE",
                    style: ChatFonts.poppins_12,
                  ),
                ),
              ),
            ),
          )
        ],
      );

  Widget _optionItem(bool showAlert, String title) => ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Visibility(
                    maintainSize: true,
                    maintainAnimation: true,
                    maintainState: true,
                    visible: showAlert,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      child: Container(
                        height: 5,
                        width: 5,
                        color: ChatColors.yellow_FD871D,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    title,
                    style: ChatFonts.poppins_12,
                  )
                ],
              ),
            ),
          ),
        ),
      );

  Positioned _titleHeader() => Positioned(
        top: (25.0 * percentage) + 25.0,
        left: -160 * (1.0 - _getPercentForRowOptions(base: 0.60)),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 40.0,
            right: 10.0,
          ),
          child: Text(
            "Chat with\nfriends",
            style: ChatFonts.poppins_24,
          ),
        ),
      );

  double _marginTop() => (110.0 * percentage) + 35.0;

  double _marginLeftAll() => 250 - (250 * startAnimation);

  Widget _listNames(BuildContext context) => Positioned(
        width: MediaQuery.of(context).size.width,
        top: _marginTop(),
        left: _marginLeftAll(),
        child: ListHeaderChat(
            percentage: percentage, startAnimation: startAnimation),
      );
}
