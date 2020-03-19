class ZermeloUtil {
  static String getApiURL(String school) {
    return "https://$school.zportal.nl/api/v3";
  }

  static String createApiURL(String school, String slug, String accessToken) {
    return "${getApiURL(school)}/$slug${RegExp(r'/\?/').hasMatch(slug) ? '&' : '?'}access_token=$accessToken";
  }
}
