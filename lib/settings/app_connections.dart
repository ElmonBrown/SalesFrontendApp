class AppConnections {
  AppConnections._();

  //API BASE URLs
  static const String apiBaseUrl = "https://ventas-qa.mqconnect.com.do";
  static const String apiBaseUrlTest = "";

  //API ENDPOINTS//

  //LOGIN
  static const String sLoginSignIn = "/api/security/api/auth/signin";

  //CATALOGUE
  static const String sCategoriesList = "/api/api/category";
  static const String sCatalogueList = "/api/api/catalogue/list/";
  static const String SCatalogueDetail = "/api/api/catalogue/detail/";

  //SHOPPING CAR
  static const String _shoppingCarBaseUri = "/api/api/shoppingcar";
      //ITEMS
  static const String _shoppingCarItemsBaseUri = _shoppingCarBaseUri + "/item"; //SE USA LA MISMA URL PARA LOS ITEMS DEL CARRITO SOLO VARÍA EL MÉTODO DE LA PETICIÓN Y EL CUERPO

  static const String sShoppingCarAddItem = _shoppingCarItemsBaseUri;
  static const String sShoppingCarUpdateItem = _shoppingCarItemsBaseUri;
  static const String sShoppingCarRemoveItem = _shoppingCarItemsBaseUri + "/";
  static const String sShoppingCarGetItem = _shoppingCarItemsBaseUri + "/";

      //QUERIES
  static const String sShoppingCarGetAll = _shoppingCarBaseUri;
  static const String sShoppingCarConfirmOrder = _shoppingCarBaseUri + "/confirm";
  static const String sShoppingCarFinishOrder = _shoppingCarBaseUri + "/finish";
  static const String sShoppingCarQuotation = _shoppingCarBaseUri + "/quotation";

  //ORDERS
  static const String sOrderGetRange = "/api/order/search/list?DateStart=2022-01-01&DateEnd=2022-12-31";
  static const String sOrderGetDetail = "/api/order/search/detail?DateStart=2022-01-01&DateEnd=2022-02-02&Status=1";

  //TEMPORAL
  static String token = "";
}
