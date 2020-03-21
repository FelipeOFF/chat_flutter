import 'dart:ui';

import 'package:chat/app/modules/resources/chat_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatHeader extends StatelessWidget {
  final double percentage;
  final double height;

  const ChatHeader({Key key, @required this.percentage, @required this.height}) : super(key: key);

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
          Positioned(
            width: MediaQuery.of(context).size.width,
            top: (110.0 * percentage) + 35.0,
            child: Container(
              height: 50,
              child: ListView.separated(
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: 20,
                padding: EdgeInsets.only(left: (160 - (160.0 * percentage)) + 40.0, right: 40.0),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      color: Colors.blue,
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 12.0,
                  );
                },
              ),
            ),
          ),
          Positioned(
            top: (25.0 * percentage) + 25.0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topRight: Radius.circular(30.0), bottomRight: Radius.circular(30.0)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: Container(
                  color: ChatColors.green_135D4B.withOpacity(0.6),
                  child: Padding(
                    padding: EdgeInsets.only(left: 40.0, right: 10.0),
                    child: Text(
                      "Chat with\nfriends",
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 24.0, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
