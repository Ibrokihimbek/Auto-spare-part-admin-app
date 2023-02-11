import 'package:url_launcher/url_launcher.dart';

class LatLong {
  static Future<void> openMap(double latitude, double longitude) async {
    Uri uri = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=$latitude,$longitude",
    );
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  }
}
