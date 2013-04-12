part of readability;

String _encodeParams(Map params) {
  String paramString = "";
  params.forEach((k,v){
    if(_isValidParam(k)) paramString += "&" + k + "=" + encodeUriComponent(v);
  });
  return paramString;
}

bool _isValidParam(String param) {
  if(Client._allowedParams.contains(param)) return true;
  return false;
}

bool _isXML(Map params) {
  bool returnValue = false;
  params.forEach((k,v){
    if(k == "format" && v == "xml") returnValue = true;
  });
  return returnValue;
}