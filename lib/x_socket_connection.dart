part of xsocket;

class XSocketConnection{
  WebSocket _webSocket;
  
  String id;
  XSocketUri xSocketUri;
  XSocketSubscriptions xSocketSubscriptions;
  String storageGuid;
  
  XSocketConnection(String url){
    _webSocket = new WebSocket(url);
    
    id = new Uuid().v1();
    xSocketUri = new XSocketUri.getUri(url);
    storageGuid = window.localStorage["XSocketsClientStorageGuid" + xSocketUri.controller];
    xSocketSubscriptions = new XSocketSubscriptions()
    ..add("0xc8", _onOpen);    
    
    _webSocket.onMessage.listen((message){
      var msg = new Exportable(XSocketMessage,message.data);
      xSocketSubscriptions.fire(msg.event, new JsonObject.fromJsonString(msg.data));
    });
  }
  
  void publish(String event, dynamic data){
    var message = new XSocketMessage.getMessage(event, data);
    _webSocket.send(message.toString());
  }
  

  List<dynamic> _tempPublishes = [];
  
  void on(String event,func(JsonObject data)){
    xSocketSubscriptions.add(event, func);
    if(_webSocket.readyState == 1)
      publish("0x12c",new XSocketSubscription.getSubscription(event).toMap());
    else
      _tempPublishes.add(new XSocketSubscription.getSubscription(event).toMap());
  }
  
  void _onOpen(JsonObject data){
    window.localStorage["XSocketsClientStorageGuid" + xSocketUri.controller] = data.StorageGuid;
    _tempPublishes.forEach((pub)=>publish("0x12c", pub));
  }
}
