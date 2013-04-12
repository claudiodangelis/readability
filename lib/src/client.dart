part of readability;

class Client {
  final String token;
  final apiEndpoint = "https://www.readability.com";
  String app;
  static List _allowedParams = ["id","max_pages","format"];

  Client(this.token);

  Future<Map> parser(String url, [Map parameters]) {
    String requestUrl;
    Map response = {};
    Completer<Map> completer = new Completer<Map>();

    requestUrl = apiEndpoint + "/api/content/v1/parser"
        + "?" + "token=" + token
        + "&url=" + encodeUriComponent(url);

    if(parameters != null) requestUrl += _encodeParams(parameters);

    //TODO: review
    http.get(requestUrl).then((resp){
      if(resp.statusCode == 200){
          if(_isXML(parameters)) {
            response["xml"] = resp.body;
            completer.complete(response);
          } else {
            response = JSON.parse(resp.body);
            completer.complete(response);
          }
       } else {
         response = JSON.parse(resp.body);
         throw response["messages"];
      }
    });
    return completer.future;
  }
}