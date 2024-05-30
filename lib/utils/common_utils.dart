class CommonUtils {
  static getHostLink(String url) {
    var host = Uri.parse(url).host;
    if (url.startsWith("https")) {
      return "https://$host";
    } else {
      return "http://$host";
    }
  }
}
