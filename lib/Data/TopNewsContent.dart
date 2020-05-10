import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_tracker/Data/Country.dart';
import 'package:news_tracker/Data/News.dart';
import 'package:dio/dio.dart';
import 'package:news_tracker/config.dart';
import 'package:http/http.dart' as http;

class NewsContent extends ChangeNotifier {
  List<News> _newsList = <News>[];
  List<News> get newsList => _newsList;

  List<News> _resultList = <News>[];
  List<News> get resultList => _resultList;

  List<String> _countries = <String>[];
  List<String> get countries => _countries;

  String countryCode = 'us';

  bool addCountry(String code) {
    if (_countries.length == 0 || _countries.length == 1) {
      _countries.add(code);
      return true;
    } else {
      return false;
    }
  }

  bool isInList(String code) {
    return (_countries.contains(code)) ? true : false;
  }

  void removeCountry(String code) {
    if (isInList(code)) {
      _countries.remove(code);
    }
  }

  static final dio = Dio(
    BaseOptions(
      baseUrl: config['bing_base_url'],
      headers: {'Ocp-Apim-Subscription-Key': config['bing_api_key']},
    ),
  );

  updateMoreNews(int idx) {
    for (String country in _countries) {
      _getOneMoreNews(_resultList[idx], country);
    }
  }

  _getOneMoreNews(News news, String country) async {
    Response response = await dio.get("/news/search", queryParameters: {
      "mkt": getCountryLang[country],
      "q": news.title,
      'count': 2
    });
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var steam = response.data['value'];
      // print(steam.runtimeType);
      if (steam.length > 1) {
        news.addNestedNews(country, steam[1]['name'], steam[1]['url']);
      } else if (steam.length > 0) {
        news.addNestedNews(country, steam[0]['name'], steam[0]['url']);
      }
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load news');
    }
    notifyListeners();
  }

  queryNews(String topic) async {
    _resultList.clear();

    Response response = await dio.get("/news/search",
        queryParameters: {"mkt": getCountryLang[countryCode], "q": topic});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var steam = response.data['value'];
      steam.map((item) {
        // print(item['image'].toString());
        News temp = News(
            item['name'],
            item['description'],
            item['url'],
            null,
            // (item['image'] == null)
            //     ? null
            //     : item['image']['thumbnail']['contentUrl'],
            item['provider'][0]['name'],
            item['datePublished']);
        _resultList.add(temp);
        return;
      }).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load news');
    }
    notifyListeners();
  }

  updateList() async {
    _newsList.clear();

    var apiUrl = 'http://newsapi.org/v2/top-headlines' +
        '?' +
        'country=' +
        countryCode +
        '&' +
        'apiKey=' +
        config['news_api_key'];
    final response = await http.get(apiUrl);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var steam = json.decode(response.body)['articles'];
      steam.map((item) {
        News temp = News(item['title'], item['description'], item['url'],
            item['urlToImage'], item['source']['name'], item['publishedAt']);
        _newsList.add(temp);
        // print('### print out temp');
        // print(temp);
        return;
      }).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load news');
    }
    notifyListeners();
  }
}
