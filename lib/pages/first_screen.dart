import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nuts_activity_indicator/nuts_activity_indicator.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  PanelController _pc = new PanelController();
  FocusNode _myFocusNode = new FocusNode();
  double _height = 20;
  String _text = '';
  final _controller = TextEditingController();
  Color _agreeColor = Color(0x16ffffff);
  bool _isSelected = false;
  Color _sendButtonColor = Color.fromRGBO(241, 96, 64, 0.74);
  bool _swap = false;

  Widget buttonToSpinner(bool swap) {
    if (!swap) {
      return CupertinoButton(
          child: Text(
            'SEND CODE',
            style: TextStyle(
              color: Color.fromRGBO(255, 255, 255, 1),
              fontSize: 15,
              fontFamily: 'Lato',
              fontWeight: FontWeight.w500,
              height: 1.1,
            ),
          ),
          color: _sendButtonColor,
          borderRadius: BorderRadius.circular(10),
          onPressed: () {
            setState(() {
              _swap = true;
            });
          });
    } else {
      return NutsActivityIndicator(
        animationDuration: Duration(seconds: 1),
        activeColor: Colors.white,
        radius: 15,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
        parallaxEnabled: false,
        renderPanelSheet: false,
        color: Colors.white.withOpacity(0),
        controller: _pc,
        minHeight: 0,
        maxHeight: 300,
        panel: NumericKeyboard(
          onKeyboardTap: _onKeyboardTap,
          textColor: Colors.white,
          rightButtonFn: () {
            setState(() {
              _text = _text.substring(0, _text.length - 1);
              _controller.text = _text;
            });
          },
          rightIcon: Icon(
            CupertinoIcons.delete_left,
            color: Colors.white,
          ),
        ),
        body: CupertinoPageScaffold(
          navigationBar: CupertinoNavigationBar(
            leading: Container(
              margin: EdgeInsets.only(top: 10),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop(true);
                  },
                  child: Icon(
                    CupertinoIcons.left_chevron,
                    color: Colors.white,
                    size: 22,
                  ),
                ),
              ),
            ),
            border: Border(
              bottom: BorderSide(color: Colors.transparent),
            ),
            trailing: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                'Log In',
                style: TextStyle(
                  color: CupertinoColors.white,
                  fontSize: 16.13,
                  fontFamily: 'Lato',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            padding: EdgeInsetsDirectional.only(end: 15),
          ),
          child: GestureDetector(
            onTap: () {
              _myFocusNode.unfocus();
              _pc.close();
              _sendButtonColor = Color.fromRGBO(241, 96, 64, 0.74);
              if (_height == 300) {
                setState(() {
                  _height = 20;
                });
              }
            },
            child: Container(
              padding: EdgeInsets.only(bottom: 10),
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment(-2.1, 1),
                    end: Alignment.topRight,
                    stops: [
                      0.01,
                      0.4,
                      1
                    ],
                    colors: [
                      Colors.deepOrange,
                      Color(0xff0a376f),
                      Color(0xff042958)
                    ]),
              ),
              child: SafeArea(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 29, bottom: 35),
                      child: Text(
                        'Create New Account',
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 22,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 33, right: 33),
                      child: CupertinoTextField(
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w500,
                        ),
                        padding: EdgeInsets.only(
                            left: 19.69, right: 60.2, top: 14, bottom: 14),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(255, 255, 255, 0.1),
                            borderRadius: BorderRadius.circular(10)),
                        placeholder: "Phone",
                        controller: _controller,
                        keyboardType: TextInputType.number,
                        readOnly: true,
                        focusNode: _myFocusNode,
                        onTap: () {
                          if (_height <= 20) {
                            setState(() {
                              _height = 300;
                            });
                          }
                          _pc.open();
                          _sendButtonColor = Color.fromRGBO(241, 96, 64, 1);
                        },
                        placeholderStyle: TextStyle(
                          color: Color.fromRGBO(255, 255, 255, 0.64),
                          fontSize: 18,
                          fontFamily: 'Lato',
                          fontWeight: FontWeight.w300,
                          inherit: false,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 30, left: 45),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (_isSelected) {
                                        _agreeColor = Color(0x16ffffff);
                                        _isSelected = false;
                                      } else {
                                        _agreeColor =
                                            Color.fromRGBO(241, 96, 64, 1);
                                        _isSelected = true;
                                      }
                                    });
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: 25,
                                          height: 25,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: _agreeColor,
                                          ),
                                        ),
                                        Center(
                                          child: Icon(
                                            CupertinoIcons.checkmark_alt,
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            size: 16,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Expanded(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    text: TextSpan(
                                      text: 'I agree to ',
                                      style: TextStyle(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.5),
                                        fontSize: 14,
                                        fontFamily: 'Lato',
                                        fontWeight: FontWeight.w300,
                                        height: 1.2,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Terms and Conditions ',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w300,
                                            height: 1.2,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'and ',
                                          style: TextStyle(
                                            color: Color.fromRGBO(
                                                255, 255, 255, 0.6),
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w300,
                                            height: 1.2,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Privacy Policy',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontFamily: 'Lato',
                                            fontWeight: FontWeight.w300,
                                            height: 1.2,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 33,
                            ),
                            SizedBox(
                              width: 315,
                              height: 52,
                              child: AnimatedSwitcher(
                                duration: Duration(milliseconds: 100),
                                child: buttonToSpinner(_swap),
                              ),
                            ),
                            AnimatedContainer(
                              duration: Duration(milliseconds: 180),
                              width: 100,
                              height: _height,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  _onKeyboardTap(String value) {
    setState(() {
      _text = _text + value;
      _controller.text = _text;
    });
  }
}
