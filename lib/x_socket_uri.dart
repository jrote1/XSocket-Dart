part of xsocket;

class XSocketUri{
  static const String matchString = "^(?:([^:\\\/?#]+):)?(?:\\\/\\\/(([^:\\\/?#]*)(?::(\\d*))?))?((((?:[^?#\\\/]*\\\/)*)([^?#]*))(?:\\?([^#]*))?)";
  
  String absoluteUrl;
  String controller;
  String domain;
  String fullPath;
  String host;
  String path;
  String port;
  String scheme;
  String url;
  String relative;
  String query;
  
  XSocketUri.getUri(this.url){
    var match = new RegExp(matchString).firstMatch(url);
    url = match.group(0);
    scheme = match.group(1);
    host = match.group(2);
    domain = match.group(3);
    port = match.group(4);
    fullPath = match.group(5);
    path = match.group(6);
    relative = match.group(7);
    controller = match.group(8);
    query = match.group(9);
  }
}