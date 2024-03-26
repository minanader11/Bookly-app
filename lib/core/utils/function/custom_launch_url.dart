import 'package:url_launcher/url_launcher.dart';

Future<void>  customLaunchUrl(String url) async{
  final Uri uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    launchUrl(uri);
  }
}