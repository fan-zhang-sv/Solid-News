import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/search_bar_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:news_tracker/Data/News.dart';
import 'package:news_tracker/Data/TopNewsContent.dart';
import 'package:provider/provider.dart';
import 'package:news_tracker/Components/Card.dart';
import 'package:news_tracker/Data/Country.dart';

class SearchNewsPage extends StatefulWidget {
  SearchNewsPage({Key key}) : super(key: key);

  @override
  _SearchNewsPageState createState() => _SearchNewsPageState();
}

class _SearchNewsPageState extends State<SearchNewsPage>
    with AutomaticKeepAliveClientMixin {
  String title = 'Search News';
  String counrtyCode = 'us';
  bool showError = false;

  // Setting to true will force the tab to never be disposed. This could be dangerous.
  @override
  bool get wantKeepAlive => true;

  updateUI() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    var parser = EmojiParser();
    super.build(context);

    return Scaffold(body: SafeArea(
      child: Consumer<NewsContent>(builder: (context, newsContent, child) {
        return SearchBar<News>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 20),
          textStyle: Theme.of(context).textTheme.caption.copyWith(
                fontSize: 16,
              ),
          searchBarStyle: SearchBarStyle(
            padding: EdgeInsets.symmetric(horizontal: 10),
            borderRadius: BorderRadius.circular(3),
          ),
          headerPadding: EdgeInsets.symmetric(horizontal: 20),
          listPadding: EdgeInsets.fromLTRB(20, 10, 20, 0),
          onSearch: buildSearch(newsContent),
          placeHolder: Center(
              child: Text(
            "Search the topic that you're intersted in...",
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 14,
                ),
          )),
          cancellationWidget: Text(
            "Cancel",
            style: Theme.of(context).textTheme.caption.copyWith(
                  fontSize: 16,
                ),
          ),
          emptyWidget: Center(child: Text("Sorry, topic not found.")),
          header: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 3, 0, 8),
                child: Text(
                  'Select countries',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              if (showError)
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 2),
                  child: Text(
                    'Choose up to 2 countries',
                    style: TextStyle(
                      color: Theme.of(context).errorColor,
                      fontSize: 12,
                    ),
                  ),
                ),
              Wrap(
                children: getGroup['en']
                    .map(
                      (country) {
                        if (country == 'us') return null;
                        return Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                          child: ChoiceChip(
                            selected: newsContent.isInList(country),
                            onSelected: (bool selected) {
                              setState(() {
                                showError = false;
                                if (selected) {
                                  if (!newsContent.addCountry(country)) {
                                    showError = true;
                                  }
                                } else {
                                  newsContent.removeCountry(country);
                                }
                              });
                            },
                            label: Text(getCountryName[country]),
                          ),
                        );
                      },
                    )
                    .where((child) => child != null)
                    .toList(),
              ),
            ],
          ),
          mainAxisSpacing: 10,
          onItemFound: (News news, int index) {
            return Card(
              margin: EdgeInsets.fromLTRB(2, 2, 2, 8),
              color: Theme.of(context).chipTheme.backgroundColor,
              elevation: 2,
              child: Column(
                children: [
                  buildMainCard(
                      context, news, buildfetchMoreNews(context, index)),
                  for (String country in newsContent.countries)
                    if (news.more.containsKey(country))
                      buildMoreInkWell(context, news.more[country].url, country,
                          news.more[country].title)
                ],
              ),
            );
          },
        );
      }),
    ));
  }
}

Function buildSearch(NewsContent newsContent) {
  Future<List<News>> search(String topic) async {
    await newsContent.queryNews(topic);
    return newsContent.resultList;
  }

  return search;
}

Function buildfetchMoreNews(BuildContext context, int idx) {
  return () {
    Provider.of<NewsContent>(context, listen: false).updateMoreNews(idx);
    // NewsContent.getMoreNews(news, country);
  };
}
