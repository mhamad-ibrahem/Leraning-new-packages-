import 'package:intl/intl.dart';
import 'dart:io';

class ApplicationHelper {
  static String timeFormat(DateTime dateTime) {
    return DateFormat('hh:mm aaa').format(dateTime);
  }

  static String dateFormat(DateTime dateTime) {
    return DateFormat('dd-MM-yyyy').format(dateTime);
  }

  static String difference(DateTime dateTime) {
    if (DateTime.now().difference(dateTime).inDays != 0) {
      return '${DateTime.now().difference(dateTime).inDays} days ago';
    } else {
      if (DateTime.now().difference(dateTime).inHours != 0) {
        return '${DateTime.now().difference(dateTime).inHours} hours ago';
      } else {
        if (DateTime.now().difference(dateTime).inMinutes != 0) {
          return '${DateTime.now().difference(dateTime).inMinutes} minutes ago';
        } else {
          return '${DateTime.now().difference(dateTime).inSeconds} seconds ago';
        }
      }
    }
  }
}

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    } else if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else {
      throw UnsupportedError('Unsupported platform');
    }
  }

  static String get interstitialAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/1033173712";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/4411468910";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }

  static String get rewardedAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-7705699720931701/2375956365";
    } else if (Platform.isIOS) {
      return "ca-app-pub-3940256099942544/1712485313";
    } else {
      throw UnsupportedError("Unsupported platform");
    }
  }
}
