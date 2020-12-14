library numeric_keyboard;

import 'package:flutter/material.dart';

typedef KeyboardTapCallback = void Function(String text);

class NumericKeyboard extends StatefulWidget {
  final Color textColor;
  final Icon rightIcon;
  final Function() rightButtonFn;
  final Icon leftIcon;
  final Function() leftButtonFn;
  final KeyboardTapCallback onKeyboardTap;
  final MainAxisAlignment mainAxisAlignment;

  NumericKeyboard(
      {Key key,
        @required this.onKeyboardTap,
        this.textColor = Colors.black,
        this.rightButtonFn,
        this.rightIcon,
        this.leftButtonFn,
        this.leftIcon,
        this.mainAxisAlignment = MainAxisAlignment.spaceEvenly})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NumericKeyboardState();
  }
}

class _NumericKeyboardState extends State<NumericKeyboard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 15, right: 3, top: 5),
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[

            ButtonBar(
              buttonPadding: EdgeInsets.only(right: 9),
              alignment: widget.mainAxisAlignment,
              children: <Widget>[
                _calcButton('1'),
                _calcButton('2'),
                _calcButton('3'),
              ],
            ),
            ButtonBar(
              buttonPadding: EdgeInsets.only(right: 9),
              alignment: widget.mainAxisAlignment,
              children: <Widget>[
                _calcButton('4'),
                _calcButton('5'),
                _calcButton('6'),
              ],
            ),
            ButtonBar(
              buttonPadding: EdgeInsets.only(right: 9),
              alignment: widget.mainAxisAlignment,
              children: <Widget>[
                _calcButton('7'),
                _calcButton('8'),
                _calcButton('9'),
              ],
            ),
            ButtonBar(
              buttonPadding: EdgeInsets.only(right: 9),
              alignment: widget.mainAxisAlignment,
              children: <Widget>[
                GestureDetector(
                    onTap: () {},
                    child: Container(
                        alignment: Alignment.center,
                      width: 110,
                      height: 54,)),
                _calcButton('0'),
                GestureDetector(
                    onTap: widget.rightButtonFn,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.transparent,
                        ),
                        alignment: Alignment.center,
                        width: 110,
                        height: 54,
                        child: widget.rightIcon))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _calcButton(String value) {
    return GestureDetector(
        onTap: () {
          widget.onKeyboardTap(value);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Color(0x16ffffff),
          ),
          alignment: Alignment.center,
          width: 110,
          height: 54,
          child: Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w400),
          ),
        ));
  }
}
