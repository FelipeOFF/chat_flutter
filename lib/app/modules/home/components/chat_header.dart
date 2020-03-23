import 'dart:ui';

import 'package:chat/app/modules/home/components/list_header_chat.dart';
import 'package:chat/app/modules/resources/chat_colors.dart';
import 'package:chat/app/modules/resources/chat_fonts.dart';
import 'package:flutter/material.dart';

class ChatHeader extends StatelessWidget {
  final double percentage;
  final double startAnimation;
  final double height;

  const ChatHeader(
      {Key key,
      @required this.startAnimation,
      @required this.percentage,
      @required this.height})
      : super(key: key);

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
          ListHeaderChat(
              percentage: percentage, startAnimation: startAnimation),
          _titleHeader(),
          _buildOptions(),
          _buildHeaderBottomWhite(context)
        ],
      ),
    );
  }

  Positioned _buildHeaderBottomWhite(BuildContext context) => Positioned(
        bottom: 0,
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
        child: Opacity(
          opacity: _getPercentForRowOptions(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.0),
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

  double _getPercentForRowOptions() =>
      1.0 - ((1.0 - percentage) <= 0.14 ? (1.0 - percentage) / 0.14 : 1.0);

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
              padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
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

  Positioned _titleHeader() {
    return Positioned(
      top: (25.0 * percentage) + 25.0,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(30.0),
            bottomRight: Radius.circular(30.0)),
        child: BackdropFilter(
          filter: ImageFilter.blur(
              sigmaX: getPercentForBlur(), sigmaY: getPercentForBlur()),
          child: Container(
            color:
                ChatColors.green_135D4B.withOpacity(0.6 - (0.6 * percentage)),
            child: Padding(
              padding: EdgeInsets.only(left: 40.0, right: 10.0),
              child: Text(
                "Chat with\nfriends",
                style: ChatFonts.poppins_24,
              ),
            ),
          ),
        ),
      ),
    );
  }

  double getPercentForBlur() => 5.0 - (5.0 * percentage);
}
