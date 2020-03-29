import 'package:chat/app/modules/resources/chat_colors.dart';
import 'package:chat/app/modules/resources/chat_fonts.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen(
      {Key key,
      @required this.onClickLogin,
      @required this.statusAnimation,
      @required this.onTextChanged,
      @required this.onError})
      : super(key: key);

  final Function() onClickLogin;
  final double statusAnimation;
  final Function(String) onTextChanged;
  final String Function() onError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Flexible(
          flex: 50,
          child: Center(
            child: LayoutBuilder(
              builder: (context, constraint) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 25.0,
                    vertical: constraint.maxHeight * 0.1,
                  ),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    elevation: 2.0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[buildTextFieldName()],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        Flexible(
          flex: 50,
          child: Align(
            alignment: Alignment.topCenter,
            child: RaisedButton(
              onPressed: onClickLogin,
              child: Text("Entrar"),
            ),
          ),
        )
      ],
    );
  }

  Widget buildTextFieldName() => TextFormField(
        onChanged: onTextChanged,
        keyboardType: TextInputType.text,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            errorText: onError(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ChatColors.grey_8E8D9D,
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: ChatColors.blue_343264,
              ),
            ),
            labelText: 'Name',
            labelStyle: TextStyle(
              color:
                  onError() == null ? ChatColors.blue_343264 : Colors.redAccent,
            )),
        style: ChatFonts.poppins_grey_8E8D9D_14,
      );
}
