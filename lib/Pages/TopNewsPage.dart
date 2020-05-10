import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:news_tracker/Data/Country.dart';
import 'package:news_tracker/Data/News.dart';
import 'package:news_tracker/Data/TopNewsContent.dart';
import 'package:provider/provider.dart';
import 'package:news_tracker/Components/Card.dart';

class TopNewsPage extends StatefulWidget {
  TopNewsPage({Key key}) : super(key: key);

  @override
  _TopNewsPageState createState() => _TopNewsPageState();
}

class _TopNewsPageState extends State<TopNewsPage>
    with AutomaticKeepAliveClientMixin {
  String title = 'Top News';
  String counrtyCode = 'us';

  // Setting to true will force the tab to never be disposed. This could be dangerous.
  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    Provider.of<NewsContent>(context, listen: false).updateList();
    super.initState();
  }

  Future<void> _onRefresh() async {
    Provider.of<NewsContent>(context, listen: false).updateList();
    setState(() {});
  }

  Widget _buildNewsStream(List<News> list) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: ListView.builder(
        itemCount: (list == null) ? 0 : list.length + 1,
        itemBuilder: (BuildContext _context, int i) {
          if (i == list.length) {
            return copyright();
          } else {
            return customCard(context, list[i]);
          }
        },
      ),
    );
  }

  Widget copyright() {
    return SizedBox(
      // height: 20,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 0, 8),
        child: Text(
          'Powered by NewsAPI.org',
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: Color(0xFF555555)),
        ),
      ),
    );
  }

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
      body: Consumer<NewsContent>(builder: (context, newsContent, child) {
        return _buildNewsStream(newsContent.newsList);
      }),
    );
  }
}
