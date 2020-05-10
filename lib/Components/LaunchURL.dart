import 'package:url_launcher/url_launcher.dart';

Function makeLaunchURL(String url) {
  void _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  return _launchURL;
}
