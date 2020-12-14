import 'package:flutter/cupertino.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: Center(
          child: CupertinoButton(
            color: CupertinoColors.systemIndigo,
            child: Text('Тестовое Задание'),
            onPressed: () {
              Navigator.pushNamed(context, '/screen1');
            },
          ),
        )
    );
  }
}
