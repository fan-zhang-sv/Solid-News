import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:news_tracker/Data/Country.dart';

class MePage extends StatefulWidget {
  @override
  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> with AutomaticKeepAliveClientMixin {
  String title = 'Me';
  String counrtyCode = 'us';

  // Setting to true will force the tab to never be disposed. This could be dangerous.
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        brightness: Theme.of(context).brightness,
        title: Text(title),
        elevation: 1,
        actions: [
          ButtonTheme(
              padding: EdgeInsets.all(0),
              minWidth: 60,
              shape: CircleBorder(),
              child: FlatButton(
                child: Text(
                  parser.emojify(getEmojiName(counrtyCode)),
                  style: TextStyle(fontSize: 28.0),
                ),
                onPressed: () {
                  /*...*/
                },
              ))
        ],
      ),
      body: Center(
        child: Text(
          "Me page is under construction",
          style: Theme.of(context).textTheme.caption,
        ),
      ),
    );
  }
}
