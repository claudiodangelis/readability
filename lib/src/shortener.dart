part of readability;

Future<String> shortener(String url){
  Completer<String> completer = new Completer<String>();
  Map response;
  String requestUrl;
  final apiEndpoint = "http://www.readability.com";

  requestUrl = apiEndpoint + "/api/shortener/v1/urls";

  http.post(
      requestUrl,
      headers:{"Content-Type":"application/x-www-form-urlencoded"},
      fields:{"url":url}
      ).then((resp){
    completer.complete(JSON.parse(resp.body)["meta"]["rdd_url"]);
  });
  return completer.future;
}

