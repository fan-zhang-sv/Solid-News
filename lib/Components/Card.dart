import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:news_tracker/Data/Country.dart';
import 'package:news_tracker/Data/News.dart';
import 'package:news_tracker/Components/LaunchURL.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Card customCard(BuildContext context, News news) {
  return Card(
    margin: EdgeInsets.zero,
    color: Theme.of(context).cardTheme.color,
    elevation: Theme.of(context).cardTheme.elevation,
    child: InkWell(
        splashColor: Colors.grey.withAlpha(30),
        onTap: makeLaunchURL(news.url),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (news.imgUrl != null)
                SizedBox(
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(news.imgUrl),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 10, 2, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      news.sourceName,
                      style: Theme.of(context).textTheme.caption,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
                      child: Text(news.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline6),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          News.getTimeDifference(news.createTime),
                          style: Theme.of(context).textTheme.caption,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(6, 4, 6, 4),
                            child: Icon(
                              Icons.more_horiz,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )),
  );
}

InkWell buildMainCard(
    BuildContext context, News news, VoidCallback fetchMoreNews) {
  var parser = EmojiParser();
  return InkWell(
    splashColor: Colors.grey.withAlpha(30),
    onTap: makeLaunchURL(news.url),
    child: Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      // mainAxisSize: MainAxisSize.min,
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        if (news.imgUrl != null)
          SizedBox(
            // width: double.infinity,
            height: 150,
            child: ClipRRect(
              // borderRadius: BorderRadius.vertical(),
              child: Image.network(
                news.imgUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        Padding(
            padding: const EdgeInsets.fromLTRB(12, 12, 12, 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
                    Text(parser.emojify(getEmojiName('us'))),
                    SizedBox(width: 10),
                    Text(
                      news.sourceName,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 0, 4),
                  child: Text(news.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.headline6),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        News.getTimeDifference(news.createTime),
                        style: Theme.of(context).textTheme.caption,
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: FaIcon(FontAwesomeIcons.globeAsia),
                            iconSize: 18,
                            onPressed: () {
                              fetchMoreNews();
                            },
                          ),
                          PopupMenuButton<int>(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                            onSelected: (value) {},
                            itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 1,
                                child: Text("Share"),
                              ),
                              // PopupMenuItem(
                              //   value: 2,
                              //   child: Text("Share"),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ])
              ],
            ))
      ],
    ),
  );
}

InkWell buildMoreInkWell(
    BuildContext context, String url, String country, String title) {
  var parser = EmojiParser();
  return InkWell(
    splashColor: Colors.grey.withAlpha(30),
    onTap: makeLaunchURL(url),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 9),
          child: Text(parser.emojify(getEmojiName(country))),
        ),
        Expanded(
          child: Text(title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5),
        ),
        SizedBox(
          width: 15,
        )
      ],
    ),
  );
}
