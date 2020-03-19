class ZermeloUtil {
  static String getApiURL(String school) {
    return "https://$school.zportal.nl/api/v3";
  }

  static String createApiURL(String school, String slug, String accessToken) {
    print("$school$slug$accessToken");
    String apiURL = getApiURL(school);
    String a = slug.indexOf("?") > 1 ? "&" : "?";
    return "$apiURL/$slug${a}access_token=$accessToken";
  }
}
