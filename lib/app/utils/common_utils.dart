import 'package:flustars/flustars.dart';

class CommonUtils {
  static getHostLink(String url) {
    var host = Uri.parse(url).host;
    if (url.startsWith("https")) {
      return "https://$host";
    } else {
      return "http://$host";
    }
  }

  static String formatDate(int milliseconds){
    if(DateUtil.isToday(milliseconds)){
      // 今天
      return "今天 ${DateUtil.formatDateMs(milliseconds,format: "HH:mm")}";
    }else if(DateUtil.isYesterdayByMs(milliseconds,DateTime.now().millisecondsSinceEpoch)){
      // 昨天
      return "昨天 ${DateUtil.formatDateMs(milliseconds,format: "HH:mm")}";
    }else{
      return DateUtil.formatDateMs(milliseconds,format: "yyyy/MM/dd HH:mm");
    }
  }
}
