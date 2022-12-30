import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:http/http.dart';

class NotificationApiService {
  static Future<int> sendNotificationToUser({required  String fcmToken, required String message}) async {
    String key =
        "key=AAAAePQLhwE:APA91bExkbzv1PFTNvX4RUjWhRAAWGdAF-iQkaBAoqH5mPhBp-AXytFx6ahWAJmd4HdXTlsQzlZLeal6_KWA-2AxcZp02jfWKKAXYq9L1ZCCh6btj4xclam_UtZ6B_SfG6BUq-U7KhMp";
    var body = {
      "to": fcmToken,
      "notification": {
        "title": "Diqqat! Notification keldi",
        "body": message
      },
      "data": {
        "name": "Abdulloh",
        "age": 22,
        "job": "Programmer",
        "route": "chat"
      }
    };
     Uri uri = Uri.parse("https://fcm.googleapis.com/fcm/send");
     try {
      Response response = await https.post(
        uri,
        headers: {"Authorization": key, "Content-Type": "application/json"},
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        var t = jsonDecode(response.body);
        print("RESPONSE:$t");
        return jsonDecode(response.body)["success"] as int;
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  static Future<String> sendNotificationToAll(String topicName) async {
    String key =
        "key=AAAAePQLhwE:APA91bExkbzv1PFTNvX4RUjWhRAAWGdAF-iQkaBAoqH5mPhBp-AXytFx6ahWAJmd4HdXTlsQzlZLeal6_KWA-2AxcZp02jfWKKAXYq9L1ZCCh6btj4xclam_UtZ6B_SfG6BUq-U7KhMp";

    Map<String, dynamic> body = {
      "to": "/topics/$topicName",
      "notification": {
        "title": "Diqqat! Notification keldi",
        "body": "Bu notofication body"
      },
      "data": {
        "name": "Abdulloh",
        "age": 22,
        "job": "Programmer",
        "route": "chat"
      }
    };

    Uri uri = Uri.parse("https://fcm.googleapis.com/fcm/send");
    try {
      Response response = await https.post(
        uri,
        headers: {
          "Authorization": key,
          "Content-Type": "application/json",
        },
        body: json.encode(body),
      );
      if (response.statusCode == 200) {
        return jsonDecode(response.body)["message_id"].toString();
      } else {
        throw Exception();
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}