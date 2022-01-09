class AppConnections {
  AppConnections._();

  //API BASE URLs
  static const String apiBaseUrl = "https://ventas-qa.mqconnect.com.do";
  static const String apiBaseUrlTest = "";

  //API ENDPOINTS

  //LOGIN
  static const String sLoginSignIn = "/api/security/api/auth/signin";

  //SALES
  static const String sCategoriesList = "/api/api/category";
  static const String sCatalogueList = "/api/api/catalogue/list/";
  static const String SCatalogueDetail = "/api/api/catalogue/detail/";

  //TEMPORAL
  static String token = "";
}
