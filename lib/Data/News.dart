import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class News {
  String sourceName;
  String title;
  String description;
  String url;
  String imgUrl;
  DateTime createTime;

  Map<String, NestedNews> more;

  addNestedNews(String country, String title, String url) {
    this.more.putIfAbsent(country, () => NestedNews(title, url, country));
  }

  static getTimeDifference(DateTime time) {
    var now = DateTime.now().toUtc();
    initializeDateFormatting();
    // var diff = now.difference(time);
    if (now.isBefore(time)) {
      return 'from the future';
    } else if (now.year - time.year > 0) {
      return DateFormat.yMMMd('en-us').format(time.toLocal());
    } else if (now.month - time.month > 0) {
      return DateFormat.yMMMd('en-us').format(time.toLocal());
    } else if (now.day - time.day > 0) {
      return (now.day - time.day == 1)
          ? '1 day ago'
          : (now.day - time.day).toString() + ' days ago';
    } else if (now.hour - time.hour > 0) {
      return (now.hour - time.hour == 1)
          ? '1 hour ago'
          : (now.hour - time.hour).toString() + ' hours ago';
    } else {
      return (now.minute - time.minute == 1)
          ? '1 minute ago'
          : (now.minute - time.minute).toString() + ' minutes ago';
    }
  }

  News(this.title, this.description, this.url, this.imgUrl, this.sourceName,
      String time) {
    this.createTime = DateTime.parse(time);
    this.more = Map<String, NestedNews>();
  }
}

class NestedNews {
  String title;
  String url;
  String country;
  // String sourceName;

  NestedNews(this.title, this.url, this.country);
}
